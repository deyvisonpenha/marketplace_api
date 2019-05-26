# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
rails generate devise:install
rails g devise User
rails g migration add_authentication_token_to_users "authentication_token:string{30}:uniq"
rails g model product name 'price:decimal{10,2}' description productType tags 
rails g model vendor name cnpj:decimal description cep
rails g migration AddVendorToProduct vendor:references