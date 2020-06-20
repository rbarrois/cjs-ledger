#!/bin/sh

set -o errexit
set -o nounset

PROGNAME=$(basename ${0})
WORKDIR=$(mktemp --tmpdir --directory cjs-ledger-${PROGNAME}-XXXXXX)
TESTSDIR=$(dirname $(realpath ${0}))
SRCDIR=$(dirname ${TESTSDIR})
DATADIR=${TESTSDIR}/data

trap cleanup SIGQUIT SIGTERM EXIT

function cleanup() {
    rm --recursive --force ${WORKDIR}
}

function die() {
    echo "ERROR: $1" >&2
    exit 1
}

cd ${WORKDIR}
python ${SRCDIR}/cjs-ledger ${DATADIR} --exec npm --cache=./cache install example@0.1.0

test -d ${WORKDIR}/node_modules/example || die "Package not installed"
test -d ${WORKDIR}/node_modules/example-dep || die "Dependencies not installed"
test ! -d ${WORKDIR}/node_modules/example-devdep || die "devDependencies should not have been installed"
