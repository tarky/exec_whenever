app_name = node[:opsworks][:applications][0][:name]
rails_env = node[:deploy][app_name][:rails_env]
path = "/srv/www/#{app_name}/current"

execute 'whenever' do
  cwd path
  command "bundle exec whenever -i #{app_name}_#{rails_env} -s \"path=#{path}\" -f config/schedule_check.rb"
end
