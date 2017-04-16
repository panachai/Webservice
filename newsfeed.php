<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

//select newsfeed (tb product)
$sql = "
SELECT * FROM product ORDER BY proID
";

//show ค่า
$result = $mysqli->query($sql);
/*
proID
proName
catDeID
proDes
proDisplay
*/
if($result && $result->num_rows > 0){
    while($row = $result->fetch_assoc()){
      //echo $row['proDes'];
        $json_data[] = array(
            "proID" => $row['proID'],
            "proName" => $row['proName'],
            "catDeID" => $row['catDeID'],
            "proDes" => $row['proDes'],
            "proDisplay" => $row['proDisplay']
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
