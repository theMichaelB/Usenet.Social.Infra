#!/bin/bash

gh workflow run terraform-apply
sleep 2
gh run watch $(gh run list --workflow=terraform.yml --json name,updatedAt,databaseId | jq .[0].databaseId)
