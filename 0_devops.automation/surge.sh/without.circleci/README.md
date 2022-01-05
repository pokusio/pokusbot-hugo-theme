# Deploy

## CNAME

* https://surge.sh/help/remembering-a-domain

```bash
hugo -b http://centpourcent.surge.sh

~/siteweb_dom/public$ surge

   Welcome to surge! (surge.sh)
   Login (or create surge account) by entering email & password.

          email: 0x.eau.sauvage@gmail.com
       password:

   Running as 0x.eau.sauvage@gmail.com (Student)

        project: /home/jibl/siteweb_dom/public/
         domain: centpourcent.surge.sh
         upload: [====================] 100% eta: 0.0s (56 files, 3050852 bytes)
            CDN: [====================] 100%
     encryption: *.surge.sh, surge.sh (259 days)
             IP: 138.197.235.123

   Success! - Published to centpourcent.surge.sh


```


Premier déploiement du site : http://centpourcent.surge.sh/


## Silent Deploy


```bash
#!/usr/bin/env bash
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

```

* Also surge token can be saved to `~/.netrc` file :

```bash
$ cat ~/.netrc
machine api.heroku.com
    login jean.baptiste.lasselle@gmail.com
    password <very long token>
machine git.heroku.com
    login jean.baptiste.lasselle@gmail.com
    password <very long token>
machine surge.surge.sh
    login 0x.eau.sauvage@gmail.com
    password <very long token>

```

## ANNEX A References

* https://surge.sh/help/integrating-with-circleci
* https://blog.fossasia.org/tag/surge/
