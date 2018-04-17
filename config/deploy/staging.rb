set :stage, :staging
set :application, 'staging'
set :branch, 'staging'
set :deploy_to, '/var/www/staging'
set :rails_env, 'staging'
set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }
set :default_env, {
#    'PKG_CONFIG_PATH' => '/opt/local/bin'
  'PATH' => "/opt/local/bin:$PATH"
}
server 'staging.tnmn.work', user: 'ec2-user', roles: %w{app db web}
