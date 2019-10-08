#!/bin/bash

ssh -f derek.ahmed@bastion.dev.oneplatform.build -L 9245:elasticsearch.qa1.us-west-2.migration.dev.oneplatform.build:9200 -N
curl -X GET "localhost:9245/author-20197280/_mapping?pretty"
