# == Class: tomcat::firewall
#

class tomcat::firewall inherits tomcat {
    # resources
    case $::os['family'] {
        'RedHat': {
            # code
            exec { 'enable-port':
                command => 'firewall-cmd --permanent --add-port=8080/tcp',
                path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
                # refreshonly => true,
                notify => Exec['reload']
            }
            exec { 'reload':
                command => 'firewalld-cmd --reload',
                path => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
                # refreshonly => true,
            }
        }
        default: {
            # code
        }
    }
}
