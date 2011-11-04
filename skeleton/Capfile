#
# Load deploy capistrano recipe
#
load 'deploy'

#
# Configure libraries/recipes from Gemfile
#

# https://github.com/stjernstrom/capistrano_colors/README.rdoc
require 'capistrano_colors'

# https://github.com/railsware/capistrano-multiconfig/README.md
require 'capistrano/multiconfig'

# https://github.com/railsware/capistrano-uptodate/README.md
require 'capistrano/uptodate'

# https://github.com/railsware/capistrano-patch/README.md
require 'capistrano/patch'

# https://github.com/railsware/capistrano-calendar/README.md
require 'capistrano/calendar'

#
# Load all custom recipes
#
Dir['recipes/**/*.rb'].each { |recipe| load(recipe) }

# Load main configuration
load 'config/deploy'

# vim syntax=ruby
