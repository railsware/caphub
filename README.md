<img src="https://github.com/railsware/caphub/raw/master/caphub.png" style="float:right" />

## Caphub

Generate centralized capistrano skeleton for multiple deployment.

## Caphub Concept

Main idea of caphub is separate deployment and application code. So instead of `capify` your each project create **one** caphub repository and put **all** configurations/recipes there.

Benefits:

* no deployment/application code mix.
* all deployment located in place.
* ability to deploy multiple projects
* deployment is not limited application deployment - deploy your system configurations too! (nginx/haproxy/etc configs)
* easy to share configurations/recipes among multiple deployment.
* uptodate synchronizing with remote repository (with capistrano-uptodate).
* generate layout with caphub or write it yourself from scratch with your own recipes

## Description

Caphub is simple generation tool that follows *caphub concept*.

Caphub generates similar layout that does usual `capify` command.
Core of caphub skeleton is [capistrano-multiconfig](https://github.com/railsware/capistrano-multiconfig) gem that allows to recursively build multiple configurations. 

## Installation

    $ gem install caphub

## Usage

Generate caphub layout:

#### Capistrano 3

    $ caphub my-deploy

    Creating directory my-deploy
    Creating capistrano skeleton in my-deploy
    Initializating git repository in my-deploy

#### Capistrano 2

    $ caphub --cap 2 my-deploy

    Creating directory my-deploy
    Creating capistrano skeleton in my-deploy
    Initializating git repository in my-deploy

Layout example:

    $ tree --dirsfirst my-deploy
    my-deploy
    ├── config
    │   ├── deploy
    │   └── deploy.rb
    ├── recipes
    ├── Capfile
    └── Gemfile

Review gems into `Gemfile` and initialize gems:

    $ bundle install

Push repository remote server:

    git remote add origin your/remote/git/repo/url
    git push -u origin master

### Configurations

Put own configuration in `config/deploy`. 

E.g create `config/deploy/blog/production.rb` and it will be automatically available:

    $ bundle exec cap -T
    cap blog:production      # Load blog:production configuration

Use any recipe with configuration task (similar to multistage extension). E.g:

    $ bundle exec cap blog:production deploy:setup

### Recipes

Add gems that contains capistrano recipes to `Gemfile`.

Configure and require recipes into `Capfile`.

Put own recipes to `recipes` directory.

## References

* [capistrano](https://github.com/capistrano/capistrano)
* [capistrano-multiconfig](https://github.com/railsware/capistrano-multiconfig)
* [capistrano-uptodate](https://github.com/railsware/capistrano-uptodate#readme)
* [capistrano-patch](https://github.com/railsware/capistrano-patch#readme)
* [capistrano-calendar](https://github.com/railsware/capistrano-calendar#readme)

