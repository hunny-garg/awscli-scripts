SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile


aws cloudfront list-distributions \
--query 'DistributionList.Items[].[DomainName,Id,Origins.Items[0].DomainName,Origins.Items[0].Id]' \
--output table --no-verify-ssl 2>/dev/null
