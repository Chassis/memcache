# Memcache
A Chassis extension to install and configure memcached on your server.

## Usage
1. Add this extension to your extensions directory
2. Run `vagrant provision`
3. Set up your `content/object-cache.php` to point to the memcache
   `object-cache.php`. This is not done automatically, as Chassis never touches
   your content directory, but it's super simple to set up:

    ```php
    <?php
    if ( ! empty( $GLOBALS['memcached_servers'] ) )
        require_once dirname( ABSPATH ) . '/extensions/memcache/object-cache.php';
    ```
    
    (Note that this also ensures the extension was loaded successfully.)
4. Create a `local-config.php` file in `extensions/memcache` then configure it:
    
    #### For memcache
    `$memcached_servers = [ "hostname:11211" ];`
    
    #### For memcached
    `$memcached_servers = [ [ '127.0.0.1', 11211 ] ];`
5. Make sure you set `define( 'WP_CACHE', true );` in your root `local-config.php`.
