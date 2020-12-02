SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws ec2 describe-instances \
--query 'Reservations[].Instances[].{InstanceId:InstanceId,VPC:VpcId,KeyPair:KeyName,Name:Tags[?Key==`Name`].Value|[0],AZ:Placement.AvailabilityZone,PrivateIP:PrivateIpAddress,State:State.Name,InstanceType:InstanceType,LaunchTime:LaunchTime}' \
--no-verify-ssl --output table 2>/dev/null
