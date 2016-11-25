class memcache (
	$path = "/vagrant/extensions/memcache",
	$php_version
) {
	package { 'memcached':
		ensure => latest
	}

	if versioncmp( "${php_version}", '5.4') <= 0 {
		$php_package = 'php5'
	}
	else {
		$php_package = "php${php_version}"
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
