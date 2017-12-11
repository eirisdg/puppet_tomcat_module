# == Define: tomcat::deploy
#
define tomcat::deploy (
    $deploy_path = $::tomcat::deploy_path,
    $deploy_url
    ) {
    # NAME es el parámetro del nombre llamado desde el nodo. Será el nombre del fichero .war que queremos desplegar.
    file { '${deploy_path}/${name}.war':
        source => '${deploy_url}',
        owner => $::tomcat::user,
        group => $::tomcat::group,
        notify => Ecec['purge_context'],
    }

    exec {'purge_context':
        command => 'rm -rd ${deploy_path}/${name}.war',
        refreshonly => true,
        notify => Service[$::tomcat::service_name],
    }
}
