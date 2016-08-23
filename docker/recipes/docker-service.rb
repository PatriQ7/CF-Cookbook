execute "Install Docker" do
  user "root"
  command "wget -qO- https://get.docker.com/ | sudo sh"
end

service "docker" do
  action [:enable, :start]
end

package "Install docker-compose" do
  case node[:platform]
  when 'ubuntu', 'debian'
    package_name 'python-pip'
  end
end

execute "Install docker-compose" do
  user "root"
  command "pip install docker-compose"
end
