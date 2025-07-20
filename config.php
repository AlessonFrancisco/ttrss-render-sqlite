<?php
// Copiado de config.php-dist com ajustes para SQLite

define('DB_TYPE', 'sqlite');
define('DB_HOST', '');
define('DB_USER', '');
define('DB_NAME', 'tt-rss.sqlite');
define('DB_PASS', '');
define('DB_PORT', '');
define('MYSQL_CHARSET', 'utf8');

define('SELF_URL_PATH', 'https://ttrss-render-sqlite.onrender.com/');
define('SINGLE_USER_MODE', false);
define('SESSION_COOKIE_LIFETIME', 86400);
define('ENABLE_GZIP_OUTPUT', true);
define('PLUGINS', 'auth_internal, note');

define('LOG_DESTINATION', 'sql');
define('CONFIG_VERSION', 26);
