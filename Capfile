# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
# require 'capistrano/rails' or
require 'capistrano/bundler' # Rails needs Bundler, right?
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

require 'capistrano/rbenv'
require 'capistrano/rbenv_install'
require 'capistrano/unicorn_nginx'
require 'capistrano/faster_assets'
require 'capistrano/upload-config'
require 'capistrano/safe_deploy_to'
require 'capistrano/ssh_doctor'
require 'capistrano/rails/console'
require 'capistrano/rails/collection'
require 'capistrano/rails_tail_log'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
