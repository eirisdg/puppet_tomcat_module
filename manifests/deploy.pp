# == Define: tomcat::deploy
#
define tomcat::deploy (
    $deploy_path = $::tomcat::deploy_path,
    $deploy_url,
    $checksum = 'md5',
    $checksum_value
    ) {
    # NAME es el parámetro del nombre llamado desde el nodo. Será el nombre del fichero .war que queremos desplegar.
    file { "${deploy_path}/${name}.war":
        source => "${deploy_url}",
        owner => $::tomcat::user,
        group => $::tomcat::group,
        notify => Exec['purge_context'],
        checksum => "${checksum}",
        checksum_value => "${checksum_value}",
    }

    exec {'purge_context':
        path => ['/bin', '/usr/bin', '/usr/sbin'],
        command => "rm -rf ${deploy_path}/${name}",
        refreshonly => true,
        notify => Service[$::tomcat::service_name],
    }
}
