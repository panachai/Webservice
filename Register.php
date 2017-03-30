<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

//echo "Sawatdee : ".$_POST["sName"]." ".$_POST["sLastName"];

$name = $_POST["cusName"];
$user = $_POST["cusUser"];
$pass = $_POST["cusPass"];
$email = $_POST["cusEmail"];

//check id pass
$sql = "
INSERT INTO customer (cusName, cusUser, cusPass ,cusEmail) VALUES ('".$name."', '".$user."', '".$pass."', '".$email."')
";

//show ค่า
$result = $mysqli->query($sql);

$json_data[] = array(
    "status" => "pass"
);

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
