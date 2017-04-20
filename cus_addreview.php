<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

//productdetail
$pID = $_POST["proID"];
$pDePrice = $_POST["proDePrice"];
$pDeDes = $_POST["proDeDes"];
$sDeID = $_POST["supDeID"];
$cID = $_POST["cusID"];
$pDeDate = date("Y-m-d");

$sql = "
INSERT INTO customer (proID, proDePrice, proDeDes, supDeID, cusID, proDeDate)
 VALUES ('".$pID."', '".$pDePrice."', '".$pDeDes."', '".$sDeID."', '".$cID."', '".$pDeDate."')
";

//--------------------------------------- ทำถึงตรงนี้ ---------------------

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
