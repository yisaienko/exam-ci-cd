#!/bin/bash

echo 'Finding current Project...'

PROJECT_ID=$(gcloud config get-value project)

echo 'Creating tf backend...'

gsutil mb gs://${PROJECT_ID}-tfstate
gsutil versioning set on gs://${PROJECT_ID}-tfstate

echo Done