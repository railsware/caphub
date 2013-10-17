# Load DSL and Setup multiple configurations
# https://github.com/railsware/capistrano-multiconfig
require 'capistrano/multiconfig'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails/tree/master/assets
#   https://github.com/capistrano/rails/tree/master/migrations
#   https://github.com/railsware/capistrano-uptodate
#   https://github.com/railsware/capistrano-patch
#   https://github.com/railsware/capistrano-calendar
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/bundler'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'
# require 'capistrano/uptodate'
# require 'capistrano/patch'
# require 'capistrano/calendar'

# Loads custom tasks
Dir.glob('tasks/*.cap').each { |r| import r }

# vim syntax=ruby
