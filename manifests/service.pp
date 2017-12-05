# == Class: tomcat::service
#

class tomcat::service {
    # resources
        service { 'tomcat':
            ensure => running,
            enable => true,
            hasrestart => true,
            hasstatus  => true,
            # pattern => 'name',
        }
}
