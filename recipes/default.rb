app_name   = node[:opsworks][:applications][0][:name]
path       = "/srv/www/#{app_name}/current"
identifier = "#{app_name}_#{node[:deploy][app_name][:rails_env]}"

execute 'whenever' do
  cwd path
  command "bundle exec whenever -i #{identifier} -s \"path=#{path}\""
end
