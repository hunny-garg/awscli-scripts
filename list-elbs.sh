SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws elb describe-load-balancers \
--query 'LoadBalancerDescriptions[].{ELBName:LoadBalancerName,DNSName:DNSName,VPCId:VPCId,Scheme:Scheme}' \
--no-verify-ssl --output=table 2>/dev/null
