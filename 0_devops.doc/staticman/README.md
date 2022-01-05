

Staticman:
* install avec Github Token : https://staticman.net/docs/getting-started.html
* comments with staticman : https://yasoob.me/posts/running_staticman_on_static_hugo_blog_with_nested_comments/
* see also : https://travisdowns.github.io/blog/2020/02/05/now-with-comments.html

## TODOs

* reCAPTCHA
* https for staticman and webserver
* all hardening options for static man API (API KEY etc...)
* bot Github user used by staticman to manage comments
* use bot Github User 's Github Token and SSH Key pair for staticman configuration `config.production.json`

## Architecture

* A static man server runs at `staticman.centpourcentjaune.io`
* The static webserver runs at `centpourcentjaune.io`

### Implementation 1 : a Docker Compose

* in AWS
* in Azure
* in Alibaba
* in another Part of the World's Cloud Provider :
  * find a set of countries which are in very bad terms with USA and EU, identify cloud providers over there
  * use the selected cloud providers

### Implementation 2 : a Kubernetes Cluster

* One namespace for staticman
* One namespace for he static website
* `External DNS` automation with OVH, with other cloud providers
* Let's encrypt SSL Certs, with automatic renewal, using `cert-manager` ( do not delegate that responsibility to `traefik`)
* One namespace for the gitlab CE alternative
* One namespace for the gitea CE alternative






## Automation

* Configure and Start the StaticMan :

```bash
export STATICMAN_SERVER_HOME=/opt/staticman-server

mkdir -p ${STATICMAN_SERVER_HOME}

git clone git@github.com:eduardoboucas/staticman.git ${STATICMAN_SERVER_HOME}

cd ${STATICMAN_SERVER_HOME}
npm i

export STATICMAN_PORT=8088
export YOUR_GITHUB_TOKEN="<secret value>"
export YOUR_GITLAB_TOKEN="<secret value>"

export GENERATED_PRIV_RSA_KEY=$(cat ~/.ssh/staticman_key | tr -d '\n')
export GENERATED_PRIV_RSA_KEY=$(openssl genrsa | sed '$!s/$/\\n/' | tr -d '\n')

echo -e "GENERATED_PRIV_RSA_KEY=[${GENERATED_PRIV_RSA_KEY}]"
echo "GENERATED_PRIV_RSA_KEY=[${GENERATED_PRIV_RSA_KEY}]"


cat << EOF > ./config.production.js
{
  "gitlabToken": "${YOUR_GITLAB_TOKEN}",
  "githubToken": "${YOUR_GITHUB_TOKEN}",
  "rsaPrivateKey": "${GENERATED_PRIV_RSA_KEY}",
  "port": ${STATICMAN_PORT}
}
EOF

NODE_ENV=production npm start
```

### Modify the Hugo project for Staticman

* Modify the Hugo project for Staticman :
  * Add the `staticman.yml` to the hugo project,
  * Add the staticman configuration into the `config.toml` hugo configuration file
  * Add the `{{ comments.html . }}` in the layout file of your posts
  * _(TO CONFIRM) Add the `staticman-comments.js` javascript functions script, and the `staticman.load.html` hugo partial file_

```bash
export STATICMAN_PORT=8088
export STATICMAN_HOST=staticman.centpourcentjaune.io
export STATICMAN_HTTP_OR_HTTPS=https
if [ "x${STATICMAN_PORT}" == "x" ]; then
  export STATICMAN_API_ENDPOINT="${STATICMAN_HTTP_OR_HTTPS}://${STATICMAN_HOST}/v2/entry"
else
  # --- #
  export STATICMAN_API_ENDPOINT="${STATICMAN_HTTP_OR_HTTPS}://${STATICMAN_HOST}:${STATICMAN_PORT}/v2/entry"
fi;

export HUGO_PROJ_GIT_SSH_URI="git@github.com:Jean-Baptiste-Lasselle/siteweb_dom.git"
export GITHUB_USERNAME_OR_ORG="Jean-Baptiste-Lasselle"
export GITHUB_USERNAME_OR_ORG=$(echo ${HUGO_PROJ_GIT_SSH_URI} | awk -F '/' '{print $1}' | awk -F ':' '{print $NF}')
export GITHUB_REPO_NAME=$(echo ${HUGO_PROJ_GIT_SSH_URI} | awk -F '/' '{print $NF}' | awk -F '\\.git' '{print $1}')
echo "GITHUB_REPO_NAME=[${GITHUB_REPO_NAME}]"
echo "GITHUB_USERNAME_OR_ORG=[${GITHUB_USERNAME_OR_ORG}]"

# --
# The git branch which wil be the Git Target Branch of all Staticman PRs
export STATICMAN_GIT_BRANCH="master"
export STATICMAN_GIT_BRANCH="develop"
export STATICMAN_GIT_BRANCH="feature/cicd-pipeline"
export STATICMAN_GIT_BRANCH=$(git branch -a | grep '*' | awk '{print $NF}')
export STATICMAN_GIT_BRANCH_URL_ENCODED=$(git branch -a | grep '*' | awk '{print $NF}' | sed "s#/#%2F#g")
echo "STATICMAN_GIT_BRANCH=[${STATICMAN_GIT_BRANCH}]"
echo "STATICMAN_GIT_BRANCH_URL_ENCODED=[${STATICMAN_GIT_BRANCH_URL_ENCODED}]"

cat << EOF > ./staticman.yml
---
comments:
  allowedFields:
    - name
    - email
    - website
    - comment
    - reply_to
  branch: "${STATICMAN_GIT_BRANCH}"
  commitMessage: "New comment in {options.slug}"
  filename: "comment-{@timestamp}"
  format: yaml
  generatedFields:
    date:
      options:
        format: iso8601
      type: date
  moderation: true
  path: "data/comments/{options.slug}"
  requiredFields:
    - name
    - email
    - comment
  transforms:
    email: md5
EOF

cat << EOF > ./addon.config.toml
# --- COMMENTAIRES STATICMAN
[params.staticman]
    endpoint = "${STATICMAN_API_ENDPOINT}"
    username = "${GITHUB_USERNAME_OR_ORG}"
    repository = "${GITHUB_REPO_NAME}"
    branch = "${STATICMAN_GIT_BRANCH_URL_ENCODED}"
EOF

cat ./addon.config.toml | tee -a ./config.toml


cat << EOF > ./themes/hugo-nederburg-theme/static/js/staticman-comments.js
function changeValue(elementName, newValue){
  document.getElementsByName(elementName)[0].value=newValue;
  window.location.hash = "#comment-form";
};
EOF

read -p "Please Add the `{{ comments.html . }}` in the layout file of your posts, then press the Enter Key" ONSENFOUT
git add -A && git commit -m "setting up staticman" && git push -u origin HEAD

```


## Souveraineté

J'ai un miroir du projet Staticman ici : https://gitlab.com/second-bureau/recuperations/miroir-staticman
