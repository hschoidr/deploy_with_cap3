# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'deploy_with_cap3'
set :repo_url, "git@github.com:hschoidr/#{fetch(:application)}.git"
set :deploy_to, "/home/deployer/apps/#{fetch(:application)}"

set :rbenv_type, :user # or :system, depends on your rbenv setup
# set :rbenv_custom_path, '/home/deployer/.rbenv/'
set :rbenv_ruby, '2.2.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default values

# set :rails_env, "production"

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :config_files, fetch(:linked_files)
set :pty, true
set :keep_releases, 5

# set :default_env , { path: '$PATH:/sbin' }

before 'deploy:check:linked_files', 'config:push'

Rake::Task['deploy:assets:backup_manifest'].clear_actions

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute :sudo, :unicorn, 'restart'
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end