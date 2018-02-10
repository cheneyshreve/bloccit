## Bloccit: a Reddit replica to teach the fundamentals of web development and Rails.
Bloccit is a resource for sharing links with your friends!

Access the app here on [Heroku](https://radiant-meadow-79731.herokuapp.com/)

## Some key features of Bloccit:
- users can sign up for a free account
- users can add, update, and edit topics and messages
- users can vote on and favorite comments and posts
- user profile page shows a history of user activity, keeping track of favorited posts, comments,
and shows user's personal avatar

## Installation
- feel free to clone of download the source code from this repository
- all gems are listed in the Gemfile of this repository

## Setup and Configuration
Languages and frameworks:
- ruby
- Ruby-on-rails
- bootstrap-sass

Setup
- figaro was used in config.yml and added to .gitignore
- setup examples can found in config/application.example.yml

Running Bloccit locally:
- clone the repository on gitload
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails server
navigate to localhost:3000 in your web browser
