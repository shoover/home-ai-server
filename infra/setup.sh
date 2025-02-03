#!/bin/bash
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
AWS_REGION=us-east-2

# Create policy, user, attach policy, create keys and output in .env format
aws iam create-policy \
    --policy-name open-webui-invoke \
    --policy-document file://open-webui-invoke-policy.json

aws iam create-user --user-name open-webui-local-server

aws iam attach-user-policy \
    --user-name open-webui-local-server \
    --policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/open-webui-invoke

aws iam create-access-key \
    --user-name open-webui-local-server \
    --query 'AccessKey.[AccessKeyId,SecretAccessKey]' \
    --output text | awk '{print "OPENWEBUI_AWS_ACCESS_KEY_ID=" $1 "\nOPENWEBUI_AWS_SECRET_ACCESS_KEY=" $2}'

print "OPENWEBUI_AWS_REGION=${AWS_REGION}"
