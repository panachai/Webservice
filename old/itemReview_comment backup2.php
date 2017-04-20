<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

$id = $_POST["proID"];

//select comment (wait reciver post[] to where proID in [TB]productdetail)
$sql = "
SELECT * FROM productdetail where proID = ".$id."  ORDER BY proDeDate
";

//show ค่า
$result = $mysqli->query($sql);
/*
proDeID
proID
proDePrice
proDeDes
supDeID
cusID
proDeScore
proDeDate
proDeStatus
*/
if($result && $result->num_rows > 0){
    while($row = $result->fetch_assoc()){
      //echo $row['proDes'];
        $json_data[] = array(
            "proDeID" => $row['proDeID'],
            "proID" => $row['proID'],
            "proDePrice" => $row['proDePrice'],
            "proDeDes" => $row['proDeDes'],
            "supDeID" => $row['supDeID'],
            "cusID" => $row['cusID'],
            "proDeScore" => $row['proDeScore'],
            "proDeDate" => $row['proDeDate'],
            "proDeStatus" => $row['proDeStatus']
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
