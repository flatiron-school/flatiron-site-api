# The Flatiron School Twitter API

## Setup for Development
1. git clone https://github.com/flatiron-school/flatiron-twitter-api.git
2. bundle install
3. rake db:migrate
4. rake db:seed
5. Insert Twitter OAuth credentials in /config/initializers/twitter_oauth.rb
6. rails s
7. View in http://localhost:3000

## Production Deploy to Heroku
1. heroku create
2. git push heroku
3. heroku rake db:migrate (if neccesary)
4. heroku rake db:seed (if neccesary)

## Changes
- git pull before making any changes

## Issues
- Submit git issues: https://github.com/flatiron-school/flatiron-twitter-api/issues

jon@flatironschool.com
@jongrover