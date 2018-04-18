# config valid only for current version of Capistrano
lock '3.10.2'

set :repo_url,  'git@github.com:TanakaMana/protospace.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/tanamana/.ssh/test.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
set :stages, %(production, staging)
set :default_stage, "staging"

# bundler
set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }

set :log_level, :debug

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :start, roles: :app, except: { no_release: true } do
    run "cd #{current_path} && bundle exec unicorn_rails -c config/unicorn.rb -E #{rails_env} -D"
  end

  task :stop, roles: :app, except: { no_release: true } do
    run "kill -KILL -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end
  task :restart do
    invoke 'unicorn:restart'
  end
end
