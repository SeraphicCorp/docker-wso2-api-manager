#/bin/bash

HOSTNAME=`hostname`

grep -rl 'localhost' /opt/wso2/repository/conf | xargs sed -i "s/localhost/$HOSTNAME/g"

exit 0