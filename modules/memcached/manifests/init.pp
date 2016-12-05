class memcached (
	$path = "/vagrant/extensions/memcached"
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
		content => template('memcached/local-config.php.erb'),
	}
}
