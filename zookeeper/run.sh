#!/bin/sh

set -o errexit
set -o nounset
#set -o pipefail

START_COMMAND="zkServer.sh start-foreground $@"

exec ${START_COMMAND}
