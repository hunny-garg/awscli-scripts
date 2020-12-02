SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws iam list-roles \
--query 'Roles[].{RoleName:RoleName,RoleId:RoleId,CreateDate:CreateDate}' \
--no-verify-ssl --output table 2>/dev/null
