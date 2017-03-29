<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Document</title>
</head>

<body>
<p id="showData"></p>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript">
  $(function(){
       $.getJSON("gen_json.php",function(data){
           if(data!=null && data.length>0){ // ถ้ามีข้อมูล
               // เราสามารถเลือกข้อมูลบ้างส่วนมาแสดงได้
               $("#showData").html(data[0].username);
               // เราสามารถวนลูปแสดงข้อมูล json ได้ ด้วย $.each() ฟังก์ขัน
               $.each(data,function(i,k){
                   $("#showData").append(data[i].username+"<br>");
               });
           }
       });
  });
</script>


</body>
</html>
