set :application, 'staging'
set :branch, 'staging'
set :deploy_to, '/var/www/staging'
set :rails_env, 'staging'
set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }
server '52.197.135.183', user: 'ec2-user', roles: %w{app db web}
