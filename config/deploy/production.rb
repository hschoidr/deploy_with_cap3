server '14.63.223.8', user: 'deployer', roles: %w{web app db}

set :nginx_server_name, 'deploywithcap3.ror.la'
set :unicorn_workers, 4