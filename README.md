# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## What's it Got?
### Sold Out Badge:

- When the store stock reaches zero, a badge appears!

### App Admin Access

- Only the user with Administrative Access can access the Admin Dashboard, Category, and Product Index.
- The Admin can list and create new categories for products.

### User Authentication

- New users can sign up on any page on the website, as long as they meet the fill out the form and have a unique email.
- Logged in users have access to certain features, such as leaving/deleteing their own product reviews.

### Email Receipt

- The user receives an email from the store
    - Email contains order-specific table information, such as their order id, and a list of the items purchased.
