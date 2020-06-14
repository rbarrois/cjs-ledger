#!/bin/sh

PACKAGE_NAME=cjs-ledger
REPO=filedist@dist.xelnor.net:pub/

echo "** Latest tags:"
git tag --list --sort taggerdate | tail -n 5

echo -e "** Type in version number to release:\n> "
read version

TAG_NAME=${PACKAGE_NAME}-${version}

echo "** Tagging as ${TAG_NAME}..."
git tag "${TAG_NAME}"

ARCHIVE="dist/${TAG_NAME}.tar.gz"
echo "** Exporting archive to ${ARCHIVE}"
git archive --format=tar.gz --prefix="${TAG_NAME}/" --output="${ARCHIVE}" ${TAG_NAME}

echo "** Uploading archive..."
scp ${ARCHIVE} ${REPO}

echo "** Pushing.."
git push origin ${TAG_NAME}
