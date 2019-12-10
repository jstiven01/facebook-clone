# Project: Building Facebook
This project is about building a large portion of the core Facebook user functionality. You can check the complete description [here](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project#project-building-facebook)

## Built With:
ruby 2.6.3, rails 5.2.3

## Author
Johan Tinjaca https://github.com/jstiven01

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```
Then you should use the next Facebook ID because this project uses figaro in order to hide those keys.

```
$  FACEBOOK_APP_ID: "1353273284853558"
```
Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rspec
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
