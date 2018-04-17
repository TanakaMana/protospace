set :application, 'protospace'
set :branch, 'master'
set :deploy_to, '/var/www/protospace'
set :rails_env, 'production'
server 'www.tnmn.work', user: 'ec2-user', roles: %w{app db web}
