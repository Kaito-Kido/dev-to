# Dev-to clone

This is my project to learn how to build a app using Ruby on Rails framework. Watch demo [here](http://137.184.91.249/)

- Ruby [2.7.0](https://github.com/rbenv/rbenv)
- Rails [6.1.3](https://github.com/rails/rails)

## Features

- View and edit profile user
- Create article, also view, edit and delete article
- Like and comment post
- Bookmark for read later
- Share post to facebook
- Search for post and user

## Installation

Install the dependencies and devDependencies and start the server.

### 1. Clone this repository to machine

```
git clone https://github.com/Kaito-Kido/dev-to.git
```

### 2. Installing necessary gem and setup the database

- If you haven't installed `bundler` yet:

```
gem install bundler
```

- Installing gem in Gemfile:

```
$ cd dev-to
$ bundle install # or bundle
```

- Migrating database:

```
rails db:migrate
```

- If you want to create fake data, run:

```
rails db:seed
```

### 4. Local hosting

Open a terminal and run:

```
rails s
```

Open another terminal to run webpack for javascript compling;

```
bin/webpack-dev-server
```

> **_NOTE:_** You will need to run `npm install` or `yarn install` to install all the package before start the webpack.

Your **dev-to** app will be on [localhost](http://localhost:3000/home/index)

## License

MIT
