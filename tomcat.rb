package "software-properties-common" do
	action :install
end

execute "add ppa:webupd8team/java" do
	command <<-EOF
		echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
		add-apt-repository -y ppa:webupd8team/java
		apt-get update
	EOF
end

package "oracle-java8-installer" do
	action :install
	options "--force-yes"
end
