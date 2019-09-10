# Daffodil Parker Ordering System
This project was for a florist who needed to streamline how their buyer put together order quantities. Modeled on their spreadsheet system, this internal web app enables their designers to create and track their recipes digitally, and outputs finalized excel sheets that the buyer can use to place their orders.

*All names and numbers in the demo are of my own invention and not representative of Daffodil Parker.*

## Getting Started
#### Prerequisites
* [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)  
* [PostgreSQL 11](https://www.postgresql.org/docs/11/tutorial-install.html) 

#### Installing
1. Clone repository to local system
2. Navigate to repo folder and install all dependencies by running `bundle install`

#### Setting up the Database
1. In `daffodil-demo/config/database.yml` set the database name as whatever you'd like (the default is `daffodil_demo_development`)  
2. Run `Rails db:migrate` to run all migrations and create tables  
3. Run `Rails db:seed` to seed provided data  

   *In order to set up the database to reset itself hourly as mentioned in the login screen, you must set up a scheduled script to run `rake reset_demo`*

#### Running the app
1. Test the app by running `rails s`
2. The app should be accessible at `localhost:3000`
3. To stop the demo, press `Ctrl+C`

## Built With
* Ruby on Rails 5
* PostgreSQL
* Bootstrap 4

#### Noteworthy Gems:
* [bcrypt-ruby](https://github.com/codahale/bcrypt-ruby) 
* [deep_cloneable](https://github.com/moiristo/deep_cloneable) 
* [rubyzip](https://github.com/rubyzip/rubyzip)
* [axlsx](https://github.com/randym/axlsx) 
* [axlsx_rails](https://github.com/caxlsx/axlsx_rails) 
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) 

## Authors
* [David Agudelo-Frankel](https://davidaf.com)  
