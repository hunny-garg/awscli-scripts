SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws ecr describe-repositories \
--query 'repositories[].{repositoryName:repositoryName,repositoryArn:repositoryArn,repositoryUri:repositoryUri}' \
--no-verify-ssl --output table 2>/dev/null
