<?php
echo "mb_internal_encoding: " . mb_internal_encoding(). "<br>\n";
echo "mb_get_info: " . mb_get_info("internal_encoding") . "<br>\n";
echo "ini_get: " . ini_get("mbstring.internal_encoding");
phpinfo();
