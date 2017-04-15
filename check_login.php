<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

//echo "Sawatdee : ".$_POST["sName"]." ".$_POST["sLastName"];

$id = $_POST["cusUser"];
$pass = md5($_POST["cusPass"]);
$type = $_POST["cusType"]; //0 == android ,1 == web

//check id pass
$sql = "
SELECT * FROM customer where cusUser = '".$id."' and cusPass = '".$pass."'
";

//show ค่า
$result = $mysqli->query($sql);
if($result && $result->num_rows > 0){
    while($row = $result->fetch_assoc()){
      //echo $row['cusID'];
        $json_data[] = array(
            "cusID" => $row['cusID'],
            "cusName" => $row['cusName'],
            "cusStatus" => $row['cusStatus'],
            "cusUser" => $row['cusUser'],
            "cusPass" => $row['cusPass'],
            "cusEmail" => $row['cusEmail']
        );
    }
}

if($type == "0"){
  // แปลง array เป็นรูปแบบ json string
  if(isset($json_data)){
      $json= json_encode($json_data);
      if(isset($_GET['callback']) && $_GET['callback']!=""){
      echo $_GET['callback']."(".$json.");";
      }else{
      echo $json;
      }
  }
}else{
  echo "\nweb";
}



?>
