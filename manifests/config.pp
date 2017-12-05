# == Class: tomcat::config
#
class tomcat::config {
    # resources
    file { '/etc/default/tomcat':
        source  =>  'puppet:///modules/tomcat/tomcat',
        mode    =>  '0644',
        owner   =>  'root',
        group   =>  'root',
    }
}
