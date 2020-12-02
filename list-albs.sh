SCRIPT_DIR=$(cd $(dirname $0) && pwd)

. ${SCRIPT_DIR}/aws_profile

aws elbv2 describe-load-balancers \
--query 'LoadBalancers[].{ALBName:LoadBalancerName,DnsName:DNSName,VPCId:VpcId,Scheme:Scheme,State:State.Code}' \
--no-verify-ssl --output table 2>/dev/null
