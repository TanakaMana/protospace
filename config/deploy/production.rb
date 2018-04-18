set :stage, :production
set :application, 'protospace'
set :branch, 'master'
set :deploy_to, '/var/www/protospace'
set :rails_env, 'production'
server '52.197.135.183', user: 'ec2-user', roles: %w{app db web}
