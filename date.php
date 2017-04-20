<?php

$mydate=getdate(date("U"));
$d = "$mydate[mday]";
$m = "$mydate[month]";
$y = "$mydate[year]";


echo "$mydate[weekday], $mydate[month] $mydate[mday], $mydate[year]";

echo "<br>test get date ".$d;
echo "<br>test get date ".$m;
echo "<br>test get date ".$y;

echo "<br> ".date("Y-m-d");


/*
print_r(getdate());
echo "<br><br>";
*/

// Return date/time info of a timestamp; then format the output


?>
