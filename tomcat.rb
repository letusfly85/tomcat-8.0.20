package "software-properties-common" do
	action :install
end

execute "add ppa:webupd8team/java" do
	command "add-apt-repository ppa:webupd8team/java"
end

package "oracle-java8-installer" do
	action :install
end
