SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws iam list-users \
--no-verify-ssl --output table 2>/dev/null
