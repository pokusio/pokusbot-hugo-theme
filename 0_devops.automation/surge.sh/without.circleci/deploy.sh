#!/bin/bash

# https://surge.sh/help/remembering-a-domain

export SURGE_LOGIN="0x.eau.sauvage@gmail.com"
# To get a surge.sh token :
# 1. Execute the [surge login] command : will prompt you for your email address, and your password (don't loose it!)
# 2. Execute the [surge token] command
#
# You get a token by executing the [surge token] command on yoru machine, and the [surge logout] command will expire this token
# Note that the [surge token] command will prompt you for your password, if you did not execute the [surge login] command first
export SURGE_TOKEN="<very long secret value of your surge token>"

npm i -g surge
export GIT_BRANCH_NAME=$CIRCLE_BRANCH
export GIT_BRANCH_NAME=$(git branch -a | grep '*' | awk '{print $NF}' | sed "s#/#-#g")
if [ "${GIT_BRANCH_NAME}" == "master" ]; then
  export DEPLOY_DOMAIN=https://centpourcent.surge.sh
else
  export DEPLOY_DOMAIN=https://pr-${GIT_BRANCH_NAME}-centpourcent.surge.sh
fi;

hugo -b $DEPLOY_DOMAIN
surge ./public --domain $DEPLOY_DOMAIN;
