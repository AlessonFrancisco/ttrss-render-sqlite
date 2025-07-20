<?php
putenv('TTRSS_ENV=production');

define('DB_TYPE', 'sqlite');
define('DB_NAME', 'ttrss.sqlite');

define('SELF_URL_PATH', 'https://ttrss-render-sqlite.onrender.com/');
define('ADMIN_USER', 'admin');
define('ADMIN_PASS', 'admin'); // Troque por segurança depois

define('SINGLE_USER_MODE', true);
define('ENABLE_GZIP_OUTPUT', true);
