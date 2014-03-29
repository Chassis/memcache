class memcache (
	$path = "/vagrant/extensions/memcache"
) {
	package { 'memcached':
		ensure => latest
	}

	file { "${path}/local-config.php":
		ensure => file,
		content => template('memcache/local-config.php.erb'),
	}
}
