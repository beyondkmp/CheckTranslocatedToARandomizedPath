type NativeModule = {
  checkTranslocatedToARandomizedPath: () => boolean
}

// The native binary will be loaded lazily to avoid any possible crash at start
// time, which are harder to trace.
let _nativeModule: NativeModule | undefined = undefined

function getNativeModule() {
  _nativeModule = require('bindings')('checkTranslocatedToARandomizedPath.node')
  return _nativeModule
}

export function checkTranslocatedToARandomizedPath(): boolean {
  const result = getNativeModule()?.checkTranslocatedToARandomizedPath()
  return !!result
}
