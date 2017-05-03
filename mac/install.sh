#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR/../ > /dev/null

./install-generic.sh "mac" "/usr/local/" ""

popd > /dev/null

