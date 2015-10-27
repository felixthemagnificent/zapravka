# config valid only for current version of Capistrano
lock '3.4.0'
set :user, "felix"
set :application, 'zapravkauz'
set :repo_url, 'git@github.com:felixthemagnificent/zapravka.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/site/zapravka'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Clean up all older releases
after "deploy:restart", "deploy:cleanup"

# This is where the actual deployment with Unicorn happens.
namespace :deploy do
  desc "Start the Unicorn process when it isn't already running."
  task :start do
  	run "bundle install"
    run "cd #{current_path} && unicorn -Dc #{shared_path}/config/unicorn.rb -E #{rails_env}"
  end

  desc "Initiate a rolling restart by telling Unicorn to start the new application code and kill the old process when done."
  task :restart do
  	run "bundle install"
    run "kill -USR2 $(cat #{shared_path}/pids/unicorn.pid)"
  end

  desc "Stop the application by killing the Unicorn process"
  task :stop do
  	run "bundle install"
    run "kill $(cat #{shared_path}/pids/unicorn.pid)"
  end
end