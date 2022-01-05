# `Pokus Bot` Hugo Theme

This is a [Hugo](https://themes.gohugo.io/) theme to use for skinning Bots :
* Machines that do work for you
* Example given, to create a Pull Request from within a Pipeline

## How to run the example site

* Then start the hugo server in watch mode :

```bash
export DESIRED_VERSION=master
git clone git@github.com:pokusio/pokusbot-hugo-theme.git ~/pokusbot-faaces-work
cd ~/pokusbot-faaces-work

git checkout ${DESIRED_VERSION}

# npm run spawn
# and then run :
npm i

export HUGO_SERVICES_INSTAGRAM_ACCESSTOKEN=BGvuInzyFAe
export PATH=$PATH:/usr/local/go/bin && go version
hugo serve -b http://127.0.0.1:4545 -p 4545 --bind 127.0.0.1 -w

```


## (DO NOT TRY THAT NOW) How to create a new Hugo project with this theme

* Execute :

```bash
export DESIRED_VERSION=master
git clone git@github.com:pokusio/pokusbot-hugo-theme.git ~/pokusbot-faaces-work
cd ~/pokusbot-faaces-work
git checkout ${DESIRED_VERSION}

npm i
npm run clean && npm run spawn
```

* Then run locally your new website :

```bash
export HUGO_SERVICES_INSTAGRAM_ACCESSTOKEN=BGvuInzyFAe
export PATH=$PATH:/usr/local/go/bin
hugo serve -b http://127.0.0.1:4545 -p 4545 --bind 127.0.0.1 -w

```

## How-to: Add a new bot

Soon to come

```bash
# ---

hugo --kind jaune new post/jbl-portfolio2.md

hugo --kind rouge new posts-rouge/work12.md

hugo --kind rouge-video new posts-rouge/work13.md


```
