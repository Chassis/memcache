$memcache_config = sz_load_config()

class { 'memcache':
	path => '/vagrant/extensions/memcache'
}
