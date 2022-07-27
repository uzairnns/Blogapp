# README

# Blog App
## WHAT IS Blog?
BlogApp is Rails Application where anyone can uploads his blog related to every thing and get public openions
## DEPENDENCIES
- Ruby 2.6.3
- Rails 5.2.3
- PostgreSQL > 10
- RailsAdmin 2.2.0
- Devise for authentication (v ~4.8)
- Pundit for authorization (v ~2.2)
- Bootstrap for styling views
- Active Storage for storing images
- RuboCop for styling guides
## PROJECT SETUP
### Clone project
Use git to clone the project to your local machine
### Install required dependencies
This project was built using Ruby on Rails, it has a variety of dependencies in the form of "ruby gems".
See ruby version in gemfile. A good to manage ruby installations is to install RBENV (https://github.com/sstephenson/rbenv).
Once you have ruby installed, you will need the bundler gem. To install bundler, simply run:
```
gem install bundler
```
After bundler is installed, run the following command from the root directory of the application (you may need to install some dependencies):
```
bundle install
```
After bundle install successfully run, need to install yarn and node
```
yarn install
```
To run webpack dev server run the following command (optional)
```
./bin/webpack-dev-server
```
Amazing! Now all of those sweet packages we use to make this application work should be installed.
### Configure database connection
Ensure you have Postgres running locally. Postgres is our main DB where everything is stored. If you are on a mac, http://postgresapp.com/ is an easy way to get started.
Now set Environment variables for DB_USER and DB_PASSWORD on your dev machine. If you have your configuration set up correctly and your database server is running.
Run the following commands in terminal from the root of the project:
```
rake db:setup
```
### Run Application
Move terminal to project directory and run following commands:
```
bundle install
```
```
rails s
```
