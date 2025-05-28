<?php
$server="127.0.0.1";
$user="root";
$pwd="";
$dbname="community";

$con=mysqli_connect($server,$user,$pwd,$dbname);

if($con){
    echo "";
}else {
    echo "DB not Connected";
}
      

?>