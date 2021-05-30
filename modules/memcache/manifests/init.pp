# A Chassis extension to install and configure memcached on your server.
class memcache (
	$config,
	$path = '/vagrant/extensions/memcache',
	$php_version = $config[php],
) {

	if ( ! empty( $config[disabled_extensions] ) and 'chassis/memcache' in $config[disabled_extensions] ) {
		$package = absent
	} else {
		$package = latest
	}

	package { 'memcached':
		ensure => $package
	}

	if versioncmp( $config[php], '5.4') <= 0 {
		$php_package = 'php5'
	} else {
		$php_package = 'php'
	}

	package { ["${php_package}${php_version}-memcache", "${php_package}${php_version}-memcached"]:
		ensure  => $package,
		require => Package['memcached'],
		notify  => Service["php${php_version}-fpm"]
	}
}
