# == Class: tomcat::config
#
class tomcat::config inherits tomcat {
    # resources
    file { $::tomcat::config_path :
        #source  =>  $::tomcat::config_source,
        content =>  $config_template,
        mode    =>  '0644',
        owner   =>  $::tomcat::user,
        group   =>  $::tomcat::group,
        notify  =>  Service[$::tomcat::service_name],
    }
}
