{
  'targets': [
    {
      'target_name': 'checkTranslocatedToARandomizedPath',
      'cflags!': [ '-fno-exceptions' ],
      'cflags_cc!': [ '-fno-exceptions' ],
      'msvs_settings': {
        'VCCLCompilerTool': { 'ExceptionHandling': 1 },
      },
      'include_dirs': [
        '<!(node -p "require(\'node-addon-api\').include_dir")' ],
      'defines': [
        "NAPI_VERSION=<(napi_build_version)",
      ],
      'conditions': [
        ["OS=='mac'", {
          'sources': [
            'src/main.mm',
          ],
              "cflags+": [ "-stdlib=libc++" ],
              "xcode_settings": {
                  "OTHER_CPLUSPLUSFLAGS" : [ "-std=c++11", "-stdlib=libc++", "-pthread" ],
                  "OTHER_LDFLAGS": [ "-stdlib=libc++" ],
                  "GCC_ENABLE_CPP_EXCEPTIONS": "YES",
                  "MACOSX_DEPLOYMENT_TARGET": "10.7",
                  "CLANG_CXX_LANGUAGE_STANDARD":"c++11",
                  "CLANG_CXX_LIBRARY": "libc++"
              },
          }],
      ],
    }
  ]
}
