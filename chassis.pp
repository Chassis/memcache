$memcache_config = sz_load_config()

class { 'memcache':
	path => '/vagrant/extensions/memcache',
	php_version => $memcache_config[php]
}
