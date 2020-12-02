SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws ec2 describe-route-tables \
--query 'RouteTables[].{RouteTableId:RouteTableId,VPC:VpcId}' \
--no-verify-ssl --output table 2>/dev/null
