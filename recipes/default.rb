app_name = node[:opsworks][:applications][0][:name]
rails_env = node[:deploy][app_name][:rails_env]

execute 'whenever' do
  cwd "/srv/www/#{app_name}/current"
  command "bundle exec whenever --update-cron #{app_name}_#{rails_env} -f config/schedule_check.rb"
end
