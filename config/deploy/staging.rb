set :application, 'staging'
set :branch, 'staging'
set :deploy_to, '/var/www/staging'
set :rails_env, 'staging'
server '52.197.135.183', user: 'ec2-user', roles: %w{app db web}
