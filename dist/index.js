"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.checkTranslocatedToARandomizedPath = void 0;
// The native binary will be loaded lazily to avoid any possible crash at start
// time, which are harder to trace.
let _nativeModule = undefined;
function getNativeModule() {
    _nativeModule = require('bindings')('checkTranslocatedToARandomizedPath.node');
    return _nativeModule;
}
function checkTranslocatedToARandomizedPath(pid) {
    var _a;
    const result = (_a = getNativeModule()) === null || _a === void 0 ? void 0 : _a.checkTranslocatedToARandomizedPath(pid);
    return !!result;
}
exports.checkTranslocatedToARandomizedPath = checkTranslocatedToARandomizedPath;
//# sourceMappingURL=index.js.map