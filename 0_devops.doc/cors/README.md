# The HTTP Server CORS Configuration


## Deployments via Heroku

The Apache 2 HTTP Server "`httpd`" is used to deploy the website to Heroku. An `httpd.conf` configuration file was added to configure CORS to allow all origins :

```ini
#
# Apparemment, d'après [https://enable-cors.org/server_apache.html] :
#
Header set Access-Control-Allow-Origin "*"
```


## Deployments via github pages



## Deployments `surge.sh`

ALlow all :

```bash
touch CORS
echo '*' > CORS
```

More refined configurations : https://surge.sh/help/enabling-cross-origin-resource-sharing
