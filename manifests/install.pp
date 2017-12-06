# == Class: tomcat::install
#
class tomcat::install inherits tomcat{
    # resources
    package { $::tomcat::packages :
        ensure => installed,
    }
}
