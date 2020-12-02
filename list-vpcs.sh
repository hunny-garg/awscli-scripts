SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws ec2 describe-vpcs \
--query 'Vpcs[].{VPCId:VpcId,Name:Tags[?Key==`Name`].Value|[0],InstanceTenancy:InstanceTenancy,CidrBlock:CidrBlock,State:State,IsDefault:IsDefault}' \
--no-verify-ssl --output table 2>/dev/null
