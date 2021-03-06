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

*cjs-ledger* can also execute a command while running in the background:
`cjs-ledger --exec npm install foo` will run `npm install foo` while *cjs-ledger*
accepts requests. The URL for *cjs-ledger* is exposed through the environment
variable provided through `--exec-envvar`, defaulting to `NPM_CONFIG_REGISTRY`.


## cjs-manifest

This helper file will download the dependencies of a file,
compute their checksum, and add them to a simple manifest file:
`cjs-manifest --destination=webpack.deps webpack webpack-cli`


## Installation

Once downloaded, prepare the package with `./configure` followed by `make`;
this will provide the `cjs-ledger` and `cjs-manifest` binaries.

Use `make install` to install the programs.


The programs require:

- For building: Python 3
- For execution: Python 3, NPM


This programs is distributed under the GPLv3 license.


## Testing

Run `make test` to run tests; `make clean test` to force re-run all tests.
