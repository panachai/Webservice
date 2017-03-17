<?php
    $host = "localhost";
    $user = "root";
    $pass = "";
    $db = "androiddb";

    $mysqli = new mysqli("localhost", "root","","androiddb");
    /* check connection */
    if ($mysqli->connect_errno) {
        printf("Connect failed: %s\n", $mysqli->connect_error);
        exit();
    }
    if(!$mysqli->set_charset("utf8")) {
        printf("Error loading character set utf8: %s\n", $mysqli->error);
        exit();
    }

    $sql = "SELECT * FROM member ";
    $result = mysqli_query($mysqli,$sql);
    if($result){
        while($row = mysqli_fetch_array($result,MYSQLI_ASSOC))
            $data[] = $row;

        $json = array('username' => "OK",'result' => $data);
    }else{
        $json = array('username' => "ERROR");
    }

    print(json_encode($json));
    mysqli_close($mysqli);
?>
