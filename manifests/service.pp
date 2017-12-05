# == Class: tomcat::service
#

class tomcat::service {
    # resources
        service { 'tomcat8':
            ensure => running,
            enable => true,
            hasrestart => true,
            hasstatus  => true,
            # pattern => 'name',
        }
}
