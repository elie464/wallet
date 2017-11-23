# Wallet

Demo: http://wallet-dev.us-west-2.elasticbeanstalk.com/

Simple internal wallet web app

The app is a wallet that allows the user to create Entities, and transfer/deposit/withdraw transactions to and from these Entities.

Entities are polymorphic using STI. An Entity can be a User, Team or Stock. An Entity creates an account after_create.

Transactions have a source and a target account. To withdraw, set target to nil. To deposit, set source to nil. Transactions must be greater than 0 and amount must be less than or equal to source account.

Front end uses Bootstrap and simple Ruby on Rails views.

Versions

* Ruby 2.4.1 
* Rails 5.1.4
* MySQL
 
Files of interest:

* [Entity](app/models/entity.rb)

* [Account](app/models/account.rb)

* [Transaction](app/models/transaction.rb)

* [Transactions Service](app/services/transaction_service.rb)

* [Transactions Controller](app/controllers/transactions_controller.rb)

* [Transfer Spec ](spec/features/transfers_spec.rb)

## Installation

To install, please create mysql databases:

`create database wallet_development`

`create database wallet_test`

## Testing

To run tests:

`rspec`

## API

Run Swagger to see endpoints:

`localhost:3000/swagger_doc`

