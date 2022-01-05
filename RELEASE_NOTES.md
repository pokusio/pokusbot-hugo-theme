# Containerization and CI CD

### What's in this release (TODOs)

* content management
* commentaires avec staticman et github :
  * mécanisme des commentaies avec StaticMan
  * ajouter dans le `.circleci/config.yml` :
    * un job pour faire le déploiement du sit eweb statique (surge / docker-compose / ...)
    * 

*
### How to's

* To deploy a new version of the website, just make a git flow release, using pure semver, and the Circle CI Pipelien will process the deployment

* In this version, the full example content is ready to serve with the hugo dev server, like this :

```bash
git clone git@github.com:Jean-Baptiste-Lasselle/siteweb_dom.git ~/propositions-relatives-au-ric
cd ~/propositions-relatives-au-ric
git checkout "0.0.0"
export COMMIT_MESSAGE="feat.(${FEATURE_ALIAS}): adding build and run with https://github.com/gravitee-io/gravitee-docs/blob/master/Dockerfile "
hugo serve --watch -b http://127.0.0.1:1313/
```
* to run this, you must have installed on yur machine :
  * Hugo extended at least version `0.78.2` version,
  * golang version `1.14.4`,
 *  see `README.md` for full installations instructions of those two on Debian GNU/Linux
