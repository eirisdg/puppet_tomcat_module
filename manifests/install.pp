# == Class: tomcat::install
#
class tomcat::install {
    # resources
    package { ['tomcat8']:
        ensure => installed,
    }
}
