SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws ec2 describe-nat-gateways --query 'NatGateways[].{NatGatewayId:NatGatewayId,SubnetId:SubnetId,State:State,VpcId:VpcId,PublicIp:NatGatewayAddresses[0].PublicIp}' --output table --no-verify-ssl 2>/dev/null

