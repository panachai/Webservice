<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

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

//require_once("inc/dbconnect.php");
$sql = "
SELECT * FROM member
";
$result = $mysqli->query($sql);
if($result && $result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        $json_data[] = array(
            "id" => $row['id'],
            "username" => $row['username']
        );
    }
}
// แปลง array เป็นรูปแบบ json string
if(isset($json_data)){
    $json= json_encode($json_data);
    if(isset($_GET['callback']) && $_GET['callback']!=""){
    echo $_GET['callback']."(".$json.");";
    }else{
    echo $json;
    }
}
?>
