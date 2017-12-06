# == Class: tomcat::params
#
class tomcat::params {
    $packages       = 'tomcat8'
    $user           = 'root'
    $group          = 'root'
    $config_path    = '/etc/default/tomcat'
    $service_name   = 'tomcat8'
    $service_state  = running


}
