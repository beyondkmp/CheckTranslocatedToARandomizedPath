# Check 24 hours time

A thin wrapper native interface to check the system setting is the 24 hours time
format

## Goals

- zero dependencies
- leverage TypeScript declarations wherever possible

## Install

```shellsession
$ yarn add checkTranslocatedToARandomizedPath
# or
$ npm install --save checkTranslocatedToARandomizedPath
```

## API

```typescript
import { is24hoursTimeFormat } from 'checkTranslocatedToARandomizedPath'

// is24hoursTimeFormat returns true if system time is 24 hours. returns false if 12 hours
const result = is24hoursTimeFormat()
console.log(result)
```

## Documentation

See the documentation under the
[`docs`](https://github.com/beyondkmp/checkTranslocatedToARandomizedPath/tree/master/docs)
folder.

## Supported versions

Each release includes prebuilt binaries based on
[N-API](https://nodejs.org/api/n-api.html), with support for different versions
of Node and Electron. Please refer to the
[N-API version matrix](https://nodejs.org/api/n-api.html#node-api-version-matrix)
and the release documentation for [Node](https://github.com/nodejs/Release) and
[Electron](https://electronjs.org/docs/tutorial/support) to see what is
supported currently.

## Contributing

Read the
[Setup](https://github.com/beyondkmp/checkTranslocatedToARandomizedPath/blob/master/docs/index.md#setup)
section to ensure your development environment is setup for what you need.

If you want to see something supported, open an issue to start a discussion
about it.
