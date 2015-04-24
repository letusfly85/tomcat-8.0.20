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

execute "wget tomcat" do
	tar_file="apache-tomcat-8.0.21.tar.gz"
	command <<-EOF
		wget http://www.apache.org/dist/tomcat/tomcat-8/v8.0.21/bin/#{tar_file}
		mkdir -p /var/local
		tar xfz #{tar_file} -C /var/local
	EOF
end

