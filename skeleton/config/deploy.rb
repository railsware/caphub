#
# Put here shared configuration shared among all children
#
# Read more about configurations:
# https://github.com/railsware/capistrano-multiconfig/README.md

# Configuration example for layout like:
# config/deploy/{NAMESPACE}/.../#{PROJECT_NAME}/{STAGE_NAME}.rb

set :scm, :git

set :git_shallow_clone, 1

set :deploy_via, :export

set :branch, lambda { Capistrano::CLI.ui.ask "SCM branch: " }

set(:application) { config_name.split(':').reverse[1] }

set(:stage) { config_name.split(':').last }

set(:rails_env) { stage }

set(:rake) { use_bundle ? "bundle exec rake" : "rake" }

set(:repository) { "git://scm.mycompany.com/#{application}.git" }

set(:deploy_to) { "/var/www/#{application}" }

set :calendar_username, 'vasya.pupkin@gmail.com'

set :calendar_password, 'qwery123456'

set(:calendar_name) { "mycompany-#{stage}" }

after 'deploy' do
  set :calendar_event_title, "[DEPLOYED] #{application} #{branch}: #{real_revision}"
  top.calendar.create_event
end
