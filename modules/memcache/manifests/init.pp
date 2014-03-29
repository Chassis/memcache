class memcache (
	$path = "/vagrant/extensions/memcache"
) {
	package { 'memcached':
		ensure => latest
	}
	
	package { 'php5-memcache':
		ensure  => latest,
		require => Package['memcached'],
		notify  => Service['php5-fpm']
	}

	file { "${path}/local-config.php":
		ensure => file,
		content => template('memcache/local-config.php.erb'),
	}
}
