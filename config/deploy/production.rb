set :stage, :production
set :application, 'protospace'
set :branch, 'master'
set :deploy_to, '/var/www/protospace'
set :rails_env, 'production'
server '13.230.14.152', user: 'ec2-user', roles: %w{app db web}
