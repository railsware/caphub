#
# Put here shared configuration shared among all children
#
# Read more about configurations:
# https://github.com/railsware/capistrano-multiconfig/blob/master/README.md

ask :branch, 'master'

set :application, proc { fetch(:stage).split(':').reverse[1] }

set :repo_url, proc { "git@github.com:me/#{fetch(:application)}.git" }

set :deploy_to, proc { "/var/www/#{fetch(:application)}" }

set :scm, :git

set :format, :pretty

set :log_level, :debug

set :pty, true

set :linked_files, %w{config/database.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :keep_releases, 5
