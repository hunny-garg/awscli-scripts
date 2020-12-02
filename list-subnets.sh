SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws ec2 describe-subnets \
--query 'Subnets[].{SubnetId:SubnetId,VPCId:VpcId,Name:Tags[?Key==`Name`].Value|[0],CidrBlock:CidrBlock,State:State,AvailableIpAddressCount:AvailableIpAddressCount,AvailabilityZone:AvailabilityZone}' \
--no-verify-ssl --output table 2>/dev/null
