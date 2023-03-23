#import <Foundation/Foundation.h>
#include <sys/param.h>
#include <sys/mount.h>


#include <napi.h>


Napi::Value checkTranslocatedToARandomizedPath(const Napi::CallbackInfo &info)
{

    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    const char *bundleAbsPath = [[bundlePath stringByExpandingTildeInPath] fileSystemRepresentation];
    int entryCount = getfsstat(NULL, 0, 0);
    int entrySize = sizeof(struct statfs);
    struct statfs *bufs = (struct statfs *)calloc(entryCount, entrySize);
    entryCount = getfsstat(bufs, entryCount * entrySize, MNT_NOWAIT);
    for (int i = 0; i < entryCount; i++) {
        if (!strcmp(bundleAbsPath, bufs[i].f_mntfromname)) {
            free(bufs);

            // getfsstat() may return us a cached result, and so we need to get the stat of the mounted fs.
            // If statfs() returns an error, the mounted fs is already gone.
            struct statfs stat;
            int checkResult = statfs(bundleAbsPath, &stat);
            if (checkResult != 0) {
                // Meaning the app's bundle is not mounted, that is it's not translocated.
                // It also means that the app is not loaded.
                return Napi::Value::From(info.Env(), false);
            }

                return Napi::Value::From(info.Env(), true);
        }
    }
    free(bufs);
    return Napi::Value::From(info.Env(), false);
}

Napi::Object Init(Napi::Env env, Napi::Object exports)
{
    exports.Set(Napi::String::New(env, "checkTranslocatedToARandomizedPath"), Napi::Function::New(env, checkTranslocatedToARandomizedPath));
    return exports;
}

#if NODE_MAJOR_VERSION >= 10
NAN_MODULE_WORKER_ENABLED(checkTranslocatedToARandomizedPathModule, Init)
#else
NODE_API_MODULE(checkTranslocatedToARandomizedPathModule, Init);
#endif