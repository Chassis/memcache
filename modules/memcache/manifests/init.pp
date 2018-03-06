# A Chassis extension to install and configure memcached on your server.
class memcache (
	$config,
	$path = '/vagrant/extensions/memcache',
) {
	package { 'memcached':
		ensure => latest
	}

	if versioncmp( $config[php], '5.4') <= 0 {
		$php_package = 'php5'
	} else {
		$short_ver = regsubst($config[php], '^(\d+\.\d+)\.\d+$', '\1')
		$php_package = "php${short_ver}"
	}

	package { ["${php_package}-memcache", "${php_package}-memcached"]:
		ensure  => latest,
		require => Package['memcached'],
		notify  => Service["${php_package}-fpm"]
	}
}
