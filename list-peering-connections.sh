SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws ec2 describe-vpc-peering-connections \
--query 'VpcPeeringConnections[].{VpcPeeringConnectionId:VpcPeeringConnectionId,"1-Name":Tags[?Key==`Name`].Value|[0],AccepterVpc:AccepterVpcInfo.VpcId,AccpetorCidr:AccepterVpcInfo.CidrBlock,RequesterVpc:RequesterVpcInfo.VpcId,RequesterCidr:RequesterVpcInfo.CidrBlock,Status:Status.Message}' \
--no-verify-ssl --output table 2>/dev/null
