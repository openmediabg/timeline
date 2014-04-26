# config valid only for Capistrano 3.1
lock '3.2.1'

set :application,     'timeline.openmedia.bg'
set :repo_url,        'https://github.com/openmediabg/bulgarian-media-timeline.git'
set :deploy_to,       "/home/openmedia/timeline.openmedia.bg"
set :linked_files,    %w(config/database.yml)
set :linked_dirs,     %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)
set :keep_releases,   20
set :rails_env,       'production'
set :bundle_bins,     fetch(:bundle_bins, []) + %w(puma pumactl)

namespace :deploy do
  desc 'Restart the application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute 'pumactl', '--state', current_path.join('tmp/pids/puma.state'), 'restart'
    end
  end

  after :publishing, :restart
end
