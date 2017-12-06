# == Class: tomcat::params
#
class tomcat::params {
    case $::os['family'] {
		'Debian' : {
			$packages = 'tomcat8'
            $user     = 'root'
            $group    = 'root'
            $config_path    = '/etc/default/tomcat'
            $config_source  = 'puppet:///modules/tomcat/Debian/tomcat'
            $service_name   = 'tomcat8'
		}
		'RedHat' : {
			$packages = 'tomcat'
            $user     = 'root'
            $group    = 'tomcat'
            $config_path    = '/etc/tomcat/tomcat.conf'
            $config_source  = 'puppet:///modules/tomcat/RedHat/tomcat.conf'
            $service_name   = 'tomcat'
		}
	}

    $service_state  = running

}
