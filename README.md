# Clarivic
Para lanzar a producción con Heroku, utilice los siguientes comandos:
```
heroku create
heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2
heroku buildpacks:add -i 1 https://github.com/heroku/heroku-buildpack-activestorage-preview
heroku config:set RAILS_MASTER_KEY=[LLAVE PRIVADA]
heroku git push herou master
heroku run rake db:migrate
heroku run rake db:seed
```
