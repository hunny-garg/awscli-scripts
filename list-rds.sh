SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws rds describe-db-instances \
--query 'DBInstances[].{Auto:AutoMinorVersionUpgrade,Engine:Engine,MultiAZ:MultiAZ,DBName:DBName,Endpoint:Endpoint.Address,DBInstanceStatus:DBInstanceStatus,DBInstanceIdentifier:DBInstanceIdentifier,EngineVersion:EngineVersion,DBInstanceClass:DBInstanceClass}' \
--no-verify-ssl --output table 2>/dev/null
