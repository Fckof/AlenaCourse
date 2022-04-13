<?
include_once "../connect.php";
$res=$conn->query("SELECT * FROM `дтп`")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>