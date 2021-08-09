# HOSTING INSTRUCTIONS

Follow instructions here. Below are problems you might run into

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

- Create a heroku app

- Set the heroku origin

- Push with git to heroku


## Heroku Issues

- You may need to install the Heroku CLI if you have not done so already

https://devcenter.heroku.com/articles/heroku-cli

- You may need to add the proper platform to your Gemfile.lock

```bundle lock --add-platform x86_64-linux```

- You may need to switch from Sqlite to Postgres

https://devcenter.heroku.com/articles/sqlite3

- You may need to install Postgres in order to install the Postgres gem

```brew update```
```brew install postgresql```