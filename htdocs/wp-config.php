<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'db1125814_sa208958_main');

/** MySQL database username */
define('DB_USER', 'u_sa208958');

/** MySQL database password */
define('DB_PASSWORD', 'EFiVEPvY0MPUR5O2');

/** MySQL hostname */
define('DB_HOST', '172.17.0.56');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'z6wH)i9(B7pGijM9OmysOX0Eys4EZe4zbH*9Y#C^3f62hz60hjP0L0hedfX*sUzb');
define('SECURE_AUTH_KEY',  'I2UPSXWCgL93AbBlTO!!o%ciY9m%m&gBLnFE2qax#&vkk(1Sik^@mA@!xx8Hcn6h');
define('LOGGED_IN_KEY',    'T!5LX!rPELTK@S#^R@quwMw4A!jOq^fr*Q3@IsKmFB7*rcKoxy#p&Aa9O!9v2(il');
define('NONCE_KEY',        '3k32volmsogpNl8*#(qgOxyhfJu)DJz)2!C0836W@9Y1809ugQxGzMPsuGqXdkuY');
define('AUTH_SALT',        'vTa8cyHxfe&Mv5qGsZwA9F%E50B#*PdHu39Bxi6Fi(wF@dsMTV6yNe&fM8&d*DwI');
define('SECURE_AUTH_SALT', 'P1Hh6Gv1@HYqL0zaYf(rfOoyFy^LHg8R0g!S)EotD)ExmRD20Q)Gt0!ZbKZaI@M3');
define('LOGGED_IN_SALT',   '98Kgt9*3PH*yJhqwUC6&0FNW8n3pvsa%tWnzMWnqYYZgF%C2Je1NSbkD&djFifBp');
define('NONCE_SALT',       'vWJ^YWVcuh8zmw%%HLvzlsqYS0o9j(7vMj2#nuA&GTxVy!Jx4uVA!tdAkVRevxum');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

define( 'WP_ALLOW_MULTISITE', true );

define ('FS_METHOD', 'direct');
