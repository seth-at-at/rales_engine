# Rales Engine

### Project Description
Mark and Seth's Rales Engine, our first project of Module 3 for Turing. This project imports business data and host an API. The API has record endpoints, relationship endpoints (relationships between models) and business intelligence, all of which is rendered as JSON.

Things you may want to cover:

* Ruby version: 2.3.0
* System dependencies: PostgreSQL and data from [sales engine](https://github.com/turingschool-examples/sales_engine/tree/master/data)

* Configuration:
In your terminal follows these steps to clone the project to your machine, create the database, and import the data.

  1. `cd` into the directory you want to hold this project.
  1. run `git clone git@github.com:themenintights/rales_engine.git`
  1. `cd rales_engine`
  1. `bundle install` to install the required gems for this project.
  1. `rake db:create` to create the database.
  1. `rake db:import` to import the sales data.

* RSpec Test suite
In your terminal follow these steps to run the test suite

  1. `rspec` to run the test suite

* Hosting the site on your local machine
  1. To start the server locally, run `rails server` from with the `rales_engine` directory.
  1. In your browser, visit your locally hosted api `http://localhost:3000`
  1. To explore endpoints you can view, visit `http://localhost:3000/rails/info/routes`
  1. To shutdown the server, press `ctrl-c` in your terminal.

* Spec Harness
To run the spec harness provided for this project follow these steps in your terminal.

  1. Start the server locally by running `rails server` from with the `rales_engine` directory.
  1. Open a new tab in your terminal
  1. In this new terminal tab run `git clone github.com/turingschool/rales_engine_spec_harness.git`
  1. `cd rales_engine_spec_harness`
  1. Run `bundle install`
  1. Run `rake` to run the spec harness against this project.
