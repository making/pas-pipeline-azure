#!/bin/sh
fly -t lite sp -p pas-azure \
    -c `dirname $0`/pipeline.yml \
    -l `dirname $0`/credentials.yml
