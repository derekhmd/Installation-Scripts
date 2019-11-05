#!/bin/bash


# set up port forwarding
ssh -f derek.ahmed@clarivate.com@bastion-ad.us-west-2.dev.oneplatform.build -L 9245:elasticsearch.qa2.us-west-2.migration.dev.oneplatform.build:9200 -N


# get index schema
curl -X GET "localhost:9245/_cat/indices?v"
curl -X GET "localhost:9245/author-20198260/_mapping?pretty"
