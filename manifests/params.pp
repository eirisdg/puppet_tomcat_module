# == Class: tomcat::params
#
class tomcat::params {
    case $::os['family'] {
		'Debian' : {
			$packages = 'tomcat8'
            $user     = 'root'
            $group    = 'root'
            $config_path    = '/etc/default/tomcat'
            $service_name   = 'tomcat8'
		}
		'RedHat' : {
			$packages = 'tomcat'
            $user     = 'tomcat'
            $group    = 'tomcat'
            $config_path    = '/etc/default/tomcat'
            $service_name   = 'tomcat'
		}
	}

    $service_state  = running

}
