#import <Foundation/Foundation.h>
#include <sys/param.h>
#include <sys/mount.h>

#include <napi.h>


Napi::Value checkTranslocatedToARandomizedPath(const Napi::CallbackInfo &info)
{
    NSString *filePath = [[NSBundle mainBundle] executablePath];
    if([[NSFileManager defaultManager] isWritableFileAtPath: filePath] == NO) {
        return Napi::Value::From(info.Env(), true);
    }
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