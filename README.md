# README

Mini app (Task List) developed during the selection process at AutoSeg

# Requirements

* Git
* Ruby 2.7.1
* Rails 6.0.3.4
* SQLite3
* Yarn 1.22.5
* Bundle 1.22.5

# Preparation

# Step : 1
Clone this repository:

Terminal:
git clone https://github.com/AndreAlvesdeAguiar/AutoSeg-.git

# Step : 2
Enter the downloaded repository

Terminal:
cd AutoSeg-

# Step : 3
Run Bundle

Terminal:
bundle install

# Step : 4
Run Yarn

Terminal:
yarn install

# Step : 5

So, all project dependencies are installed. Let's inhabit the seed

Terminal:
rails db:seed

-
in case of any mistake. Delete the existing database and run seed again.

Terminal:
rails db:drop
rails db:create
rails db:seed


# Step : 6

After seed we must migrate the information.
Terminal:
rails db:migrate

# Step : 7

Great. We are ready to run our application.

Terminal:
rails s

And then access the application in the browser: locahost: 3000 


# Thank you and have a nice day  :)
