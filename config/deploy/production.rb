server '52.197.135.183', user: 'ec2-user', roles: %w{app db web}

role :app, %w{ec2-user@52.197.135.183}
role :web, %w{ec2-user@52.197.135.183}
role :db,  %w{ec2-user@52.197.135.183}

set :application, 'protospace'
set :branch, 'master'
set :deploy_to, '/var/www/protospace'
set :rails_env, 'production'
set :stage, :production
