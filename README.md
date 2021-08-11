# HOSTING INSTRUCTIONS

In order to host your project, you will need to migrate to Postgres, connect with Heroku, and set up your Heroku Dyno.

See this blog for information from a Flatiron alum: https://medium.com/codex/deploying-a-rack-app-to-heroku-6d160b14904c

## Postgres Setup

- Download Postgres

MAC: 
```brew update```
```brew install postgresql```

WINDOWS: 
```sudo apt install postgresql postgresql-contrib```

- Set up a new user

Skip to Starting and Stopping a Postgres service

NOTE: For Windows users, use ```sudo service postgresql start``` instead of ```brew services start postgresql```

https://www.sqlshack.com/setting-up-a-postgresql-database-on-mac/

## Migrating from Sqlite to Postgres

- Install postgres gem

- Configure database.yml file

## Host on Heroku

- Create a heroku app ```heroku create```

- Set the heroku origin ```heroku git:remote -a your_app_name``` (app name generated with heroku create)

- Push with git to heroku ```git push heroku <branch_name>```


## Heroku Issues

- You may need to install the Heroku CLI if you have not done so already

https://devcenter.heroku.com/articles/heroku-cli

- Make sure the rake gem is added in your Gemfile
    - You will receive an error about ruby-concurrent if you do not

- You will need to install the Heroku Postgres addon
    - Check if it is already installed with ```heroku addons```
    - Run ```heroku addons:create heroku-postgresql```

- You may need to add the proper platform to your Gemfile.lock
```bundle lock --add-platform x86_64-linux```

- You may need to switch from Sqlite to Postgres
    - Remove the sqlite gem from your Gemfile
    - Add the 'pg' gem to your Gemfile
    - Configure your database.yml file to use postgres. 
    - See the production code example in this repo's database.yaml
    - https://devcenter.heroku.com/articles/sqlite3

