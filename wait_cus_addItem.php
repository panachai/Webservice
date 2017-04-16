<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

$name = $_POST["cusName"];
$user = $_POST["cusUser"];
$pass = $_POST["cusPass"];
$email = $_POST["cusEmail"];

//insert to product

/*
//product
proID ไม่ต้องใส่
proName
catDeID           //ตั้งค่าใน android
proDes
proDisplay

//productdetail
proDeID ไม่ต้องใส
proID
proDePrice
proDeDes
supID
cusID
proDeScore
proDeDate           //date("Y-m-d H:i:s") ไว้ get date
proDeStatus         default 0 รออนุมัติ

//image
imageID             ไม่ต้องใส่
proID
imagePath
imageDes


*/


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
