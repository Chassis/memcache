class memcache (
	$path = "/vagrant/extensions/memcache",
	$memcache_config = sz_load_config()
) {
	package { 'memcached':
		ensure => latest
	}

	if versioncmp( "${memcache_config[php]}", '5.4') <= 0 {
		$php_package = 'php5'
	} else {
		$php_package = "php${memcache_config[php]}"
	}

	package { "${php_package}-memcache":
		ensure  => latest,
		require => Package['memcached'],
		notify  => Service["${php_package}-fpm"]
	}

	file { "${path}/local-config.php":
		ensure => file,
		content => template('memcache/local-config.php.erb'),
	}
}
