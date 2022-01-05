# The Machine of the content manager


# Hardware Requirements

* CPU 64 bits
* 2 GB RAM
* One of the following OS :
  * Windows 7+
  * Any recent 64 bits GNU/Linux

# Software Requirements

List of tools to install on any machine (Windows, Debian ) :

* git, git flow AVH Edition
* Hugo
* Golang
* (soon : Virtual Box)

## Debian and GNU / Linux

### Git

```bash
# --- install git
# -- install git flow avh edition
```


### Hugo

* Intall hugo extended version (some hugo themes require that, and the hugo compose theme requries it, to build sass css resources) :

```bash
export PATH=$PATH:/usr/local/go/bin
# check you hugo version with [hugo version] command
# My hugonon extended installed  version was [v0.78.2] so I set HUGO_VERSION to 0.78.2 (without the v, to be pure semver)
# Set the HUGO_VERSION to the version of your hugo installation
export HUGO_VERSION=0.78.2
echo "HUGO_VERSION=[${HUGO_VERSION}]"

mkdir -p ~/.hugo.extended/v${HUGO_VERSION}
git clone https://github.com/gohugoio/hugo.git ~/.hugo.extended/v${HUGO_VERSION}
cd ~/.hugo.extended/v${HUGO_VERSION}
git checkout "v${HUGO_VERSION}"
go install --tags extended
```

### Golang

* Install the Golang platform

```bash
# Choose the version of golang you want at [https://github.com/golang/go/releases]
export GOVERSION=1.15.6
export GOOS=linux
export GO_CPU_ARCH=amd64

export DWLD_URI=https://golang.org/dl/go${GOVERSION}.${GOOS}-${GO_CPU_ARCH}.tar.gz

curl -LO https://golang.org/dl/go${GOVERSION}.${GOOS}-${GO_CPU_ARCH}.tar.gz

mkdir -p /usr/local/golang/${GOVERSION}/${GOOS}/${GO_CPU_ARCH}

# ---
# delete any previous installation

if [ -f /usr/local/go ]; then
 sudo rm -fr /usr/local/go
fi;

if [ -f /usr/local/golang/${GOVERSION}/${GOOS}/${GO_CPU_ARCH}/go ]; then
 sudo rm -fr /usr/local/golang/${GOVERSION}/${GOOS}/${GO_CPU_ARCH}/go
fi;

sudo tar -C /usr/local -xzf go${GOVERSION}.${GOOS}-${GO_CPU_ARCH}.tar.gz

# [/usr/local/golang/${GOVERSION}/${GOOS}/${GO_CPU_ARCH}/go] is a folder, executables are in [/usr/local/golang/${GOVERSION}/${GOOS}/${GO_CPU_ARCH}/go/bin]
sudo ln -s /usr/local/golang/${GOVERSION}/${GOOS}/${GO_CPU_ARCH}/go /usr/local/go

unset GOVERSION
unset GOOS
unset GO_CPU_ARCH

export PATH=$PATH:/usr/local/go/bin
go version
```



## Windows

List of tools to install on any machine (Windows, Debian ) :

* git, git flow AVH Edition :
  * `git` : https://git-scm.com/download/win
  * `git flow AVH` : https://github.com/nvie/gitflow/wiki/Windows#msysgit
* Chocolatey
* Hugo / Hugo Extended :
  * https://gohugo.io/getting-started/installing/#chocolatey-windows

* Golang
* (soon : Virtual Box)


### Git

* `git` : https://git-scm.com/download/win
* `git flow AVH` : https://github.com/nvie/gitflow/wiki/Windows#msysgit

### Chocolatey

see https://chocolatey.org/install

### Hugo

* To install Hugo and Hugo Extended :

```bash
choco install hugo -confirm
choco install hugo-extended -confirm
```

### Golang

see https://golang.org/doc/install#download
