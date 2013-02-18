#
# Cookbook Name:: sls
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "python"

web_app "gsl" do
    server_name node['gsl']['servername']
    docroot File.join(node['gsl']['directory'], "output")
end

directory node['gsl']['directory'] do
    owner node['apache']['user']
    group node['apache']['group']
    action :create
end

package "git" do
    action :install
end

git node['gsl']['directory'] do
    repository "https://github.com/michaelballantyne/gsl-weather-display.git"
    reference "master"
    action :sync
    user node['apache']['user']
    group node['apache']['group']
end

include_recipe "python"

env_dir = File.join(node['gsl']['directory'], "env")
python_virtualenv env_dir do
    owner node['apache']['user']
    group node['apache']['group']
    action :create
end

for package in ['jinja2']
    python_pip package do
        virtualenv env_dir
        user node['apache']['user']
        group node['apache']['group']
        action :install
    end
end

cron "gsl" do
    minute "*/5"
    command File.join(env_dir, 'bin/python') + ' ' + File.join(node['gsl']['directory'], 'generate.py')
    user node['apache']['user']
end
