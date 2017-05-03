#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR/../ > /dev/null

./install-generic.sh "linux" "/" "sudo"

popd > /dev/null

