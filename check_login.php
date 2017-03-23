<?php
header("Content-type:application/json; charset=UTF-8");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);

require_once("php/dbconnect.php");

//echo "Sawatdee : ".$_POST["sName"]." ".$_POST["sLastName"];

$id = $_POST["sName"];
$pass = $_POST["sLastName"];

//check id pass
$sql = "
SELECT * FROM member where username = '".$id."' and pass = '".$pass."'
";

//show ค่า
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
