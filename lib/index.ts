type NativeModule = {
  checkTranslocatedToARandomizedPath: (pid:number) => boolean
}

// The native binary will be loaded lazily to avoid any possible crash at start
// time, which are harder to trace.
let _nativeModule: NativeModule | undefined = undefined

function getNativeModule() {
  _nativeModule = require('bindings')('checkTranslocatedToARandomizedPath.node')
  return _nativeModule
}

export function checkTranslocatedToARandomizedPath(pid:number): boolean {
  const result = getNativeModule()?.checkTranslocatedToARandomizedPath(pid)
  return !!result
}
