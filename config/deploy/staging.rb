server '14.63.197.182', user: 'deployer', roles: %w{web app db}

set :nginx_server_name, 'cap3.ror.la'
set :unicorn_workers, 4