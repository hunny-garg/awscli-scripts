SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws route53 list-hosted-zones \
--query 'HostedZones[].{ResourceRecordSetCount:ResourceRecordSetCount,Comment:Config.Comment,Id:Id,Name:Name}' \
--no-verify-ssl --output table 2>/dev/null
