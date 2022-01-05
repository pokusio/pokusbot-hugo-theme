#!/bin/bash
export territoiresfuturs_ENV=${territoiresfuturs_ENV:-"staging"}
source .${territoiresfuturs_ENV}.env
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:themefisher/airspace-hugo.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:zhaohuabing/hugo-theme-cleanwhite.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:gethugothemes/infinity-hugo.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:rz3n/hugo-theme-freshstart.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:g1eny0ung/hugo-theme-dream.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@gitlab.com:avron/gruvhugo.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:gesquive/slate.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:Fastbyte01/KeepIt.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:GDGToulouse/devfest-theme-hugo.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:12bitvn/news.12bit.vn.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:somratpro/somrat.git"}
# export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:gurusabarish/hugo-profile.git"}
export HUGO_THEME_GIT_SSH=${HUGO_THEME_GIT_SSH:-"git@github.com:st-wong/hugo-spectre-pixel-theme.git"}
export HUGO_THEME_VERSION="v3.05"
export HUGO_THEME_VERSION="master"

if [ "x${HUGO_BASE_URL}" == "x" ]; then
  echo "the HUGO_BASE_URL env. var. is not defined, stopping the hugo project spawn"
  echo "set the HUGO_BASE_URL env. var.n, and re-run npm run spawn"
  exit 0
fi;

# ---
export TEMP_SPWAN_HOME=$(mktemp -d -t "TEMP_SPAN_HOME-XXXXXXXXXX")
echo "TEMP_SPWAN_HOME is now : [${TEMP_SPWAN_HOME}]"
git clone ${HUGO_THEME_GIT_SSH} ${TEMP_SPWAN_HOME}
export WHERE_AMI=$(pwd)
cd ${TEMP_SPAN_HOME}
git checkout ${HUGO_THEME_VERSION}
cd ${WHERE_AMI}

mkdir content/
mkdir data/
mkdir static/
mkdir assets/
mkdir layouts/
mkdir resources/


# cp -rT ${TEMP_SPWAN_HOME}/content ./content
cp -fR ${TEMP_SPWAN_HOME}/content/* ./content/

# cp -rT ${TEMP_SPWAN_HOME}/data ./data
cp -fR ${TEMP_SPWAN_HOME}/data/* ./data/

# cp -rT ${TEMP_SPWAN_HOME}/static ./static
cp -fR ${TEMP_SPWAN_HOME}/static/* ./static/

# cp -rT ${TEMP_SPWAN_HOME}/assets ./assets
cp -fR ${TEMP_SPWAN_HOME}/assets/* ./assets/

# cp -rT ${TEMP_SPWAN_HOME}/layouts ./layouts
cp -fR ${TEMP_SPWAN_HOME}/layouts/* ./layouts/

# cp -rT ${TEMP_SPWAN_HOME}/resources ./resources
cp -fR ${TEMP_SPWAN_HOME}/resources/* ./resources/


if [ -d ${TEMP_SPWAN_HOME}/exampleSite ]; then
  cp ${TEMP_SPWAN_HOME}/exampleSite/config.toml .
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/content/* ./content/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/data ./data
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/data/* ./data/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/static ./static
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/static/* ./static/
  cp ${TEMP_SPWAN_HOME}/exampleSite/assets/custom-theme.scss ./assets
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/content/* ./content/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/assets ./assets
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/assets/* ./assets/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/layouts ./layouts
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/layouts/* ./layouts/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/resources ./resources
  cp -fR ${TEMP_SPWAN_HOME}/exampleSite/resources/* ./resources/
fi;



if [ -d ${TEMP_SPWAN_HOME}/website ]; then
  cp ${TEMP_SPWAN_HOME}/website/config.toml .
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPWAN_HOME}/website/content/* ./content/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/data ./data
  cp -fR ${TEMP_SPWAN_HOME}/website/data/* ./data/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/static ./static
  cp -fR ${TEMP_SPWAN_HOME}/website/static/* ./static/
  cp ${TEMP_SPWAN_HOME}/website/assets/custom-theme.scss ./assets
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/content ./content
  cp -fR ${TEMP_SPWAN_HOME}/website/content/* ./content/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/assets ./assets
  cp -fR ${TEMP_SPWAN_HOME}/website/assets/* ./assets/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/layouts ./layouts
  cp -fR ${TEMP_SPWAN_HOME}/website/layouts/* ./layouts/
  # cp -rT ${TEMP_SPWAN_HOME}/exampleSite/resources ./resources
  cp -fR ${TEMP_SPWAN_HOME}/website/resources/* ./resources/
fi;



# echo '' >> ./config.toml
# echo '[params.reveal_hugo]' >> ./config.toml
# echo 'custom_theme = "assets/custom-theme.scss"' >> ./config.toml
# echo 'custom_theme_compile = true' >> ./config.toml

echo '' >> ./config.toml
echo '' >> ./config.toml
echo '[reveal_hugo.custom_theme_options]' >> ./config.toml
echo 'targetPath = "assets/custom-theme.css"' >> ./config.toml
echo 'enableSourceMap = true' >> ./config.toml


export TOML_FILE_PATH=${TEMP_SPWAN_HOME}/theme.toml
echo "TEMP_SPWAN_HOME is now : [${TEMP_SPWAN_HOME}]"
echo "TOML_FILE_PATH is : [${TOML_FILE_PATH}]"
npm run parse-hugo-them-toml | tee -a ${TEMP_SPWAN_HOME}/hugo.theme.to.json

# cat ${TEMP_SPWAN_HOME}/hugo.theme.to.json | jq .name
# cat ./.npm.scripts/hugo.theme.to.json  | jq .name | awk -F '"' '{print $2}'
cat ./.npm.scripts/hugo.theme.to.json  | jq .name | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]' | sed 's# #-#g'

# export HUGO_THEME_NAME=$(cat ${TEMP_SPWAN_HOME}/hugo.theme.to.json | jq .name)
export HUGO_THEME_NAME=$(cat ./.npm.scripts/hugo.theme.to.json  | jq .name | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]' | sed 's# #-#g')

echo "According [theme.toml], the hugo theme name is : [${HUGO_THEME_NAME}]"
mkdir -p themes/${HUGO_THEME_NAME}
cp -rT ${TEMP_SPWAN_HOME} ./themes/${HUGO_THEME_NAME}

# that's for hugo theme which have a nodejs / npm package project structure
if [ -f ./package.json ]; then
  cd ./themes/${HUGO_THEME_NAME}
  # sudo npm i -g node-sass || true
  npm i || true
  npm run build || true
  npm build || true
  cd  ../..
fi;

sed -i "s#baseURL =.*#baseURL = \"${HUGO_BASE_URL}\"#g" ./config.toml
sed -i "s#theme =.*#theme = \"${HUGO_THEME_NAME}\"#g" ./config.toml
sed -i "s#themesDir =.*#themesDir = \"./themes\"#g" ./config.toml

export PATH=$PATH:/usr/local/go/bin && go version && hugo
# export PATH=$PATH:/usr/local/go/bin && go version && hugo serve -bttp://127.0.0.1:1313
