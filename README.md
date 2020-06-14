# cjs-ledger

This package implements a minimal offline CommonJS-compliant registry.

It is intended for use in fully-offline scenarios, or for organizations
wishing to control exactly which software they import and run.

Similar projects:
- [verdaccio](https://verdaccio.org/): Acts as a local registry, and as a proxy
  to an upstream registry
- [npm-mirror](https://github.com/mozilla-b2g/npm-mirror): downloads dependency
  tarballs for a given `package.json` file, and sets up a filesystem tree for
  serving by a classical HTTP server


## Usage

Run with `cjs-ledger <path/to/packages> <listen-spec>`.
*cjs-ledger* will scan the provided path, then start listening on the
provided port, or host:port, combination.

## cjs-manifest

This helper file will download the dependencies of a file,
compute their checksum, and add them to a simple manifest file.
