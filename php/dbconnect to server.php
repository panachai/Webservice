<?php
$mysqli = new mysqli("mysql.hostinger.in.th", "u443929165_pana","123456","u443929165_droid"); //"localhost", "root","","androiddb"
/* check connection */
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}
if(!$mysqli->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $mysqli->error);
    exit();
}
?>
