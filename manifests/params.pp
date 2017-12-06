# == Class: tomcat::params
#
class tomcat::params {
    #For config template
    $catalina_pid   = '/var/run/tomcat.pid'
    $shutdown_verbose = 'false'
    
    case $::os['family'] {
		'Debian' : {
			$packages = 'tomcat8'
            $user     = 'root'
            $group    = 'root'
            $config_path    = '/etc/default/tomcat'
            $config_source  = 'puppet:///modules/tomcat/Debian/tomcat'
            $config_template = template('tomcat/Debian/tomcat.erb')
            $service_name   = 'tomcat8'
		}
		'RedHat' : {
			$packages = ['tomcat', 'tomcat-webapps']
            $user     = 'root'
            $group    = 'tomcat'
            $config_path    = '/etc/tomcat/tomcat.conf'
            $config_source  = 'puppet:///modules/tomcat/RedHat/tomcat.conf'
            $config_template = template('tomcat/RedHat/tomcat.conf.erb')
            $service_name   = 'tomcat'

		}
	}
    $port           = '8080'
    $service_state  = running


}
