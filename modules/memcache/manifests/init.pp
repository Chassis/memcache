# A Chassis extension to install and configure memcached on your server.
class memcache (
	$config,
	$path = '/vagrant/extensions/memcache',
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
		$short_ver = regsubst($config[php], '^(\d+\.\d+)\.\d+$', '\1')
		$php_package = "php"
	}

	package { ["${php_package}-memcache", "${php_package}-memcached"]:
		ensure  => $package,
		require => Package['memcached'],
		notify  => Service["php${short_ver}-fpm"]
	}
}
