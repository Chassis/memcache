# Memcached
A Chassis extension to install and configure memcached on your server.

## Usage
1. Add this extension to your extensions directory
2. Run `vagrant provision`
3. Set up your `content/object-cache.php` to point to the memcached
   `object-cache.php`. This is not done automatically, as Chassis never touches
   your content directory, but it's super simple to set up:

```php
<?php
if ( ! empty( $GLOBALS['memcached_servers'] ) )
	require_once dirname( ABSPATH ) . '/extensions/memcached/object-cache.php';
```

(Note that this also ensures the extension was loaded successfully.)
