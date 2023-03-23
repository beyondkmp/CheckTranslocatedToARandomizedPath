#include <libproc.h>
#include <unistd.h>

#include <napi.h>


Napi::Value checkTranslocatedToARandomizedPath(const Napi::CallbackInfo &info)
{
    char path[PROC_PIDPATHINFO_MAXSIZE];
    int pid = getpid();
    int ret = proc_pidpath(pid, path, sizeof(path));
    if (ret <= 0) {
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