<?
include_once "../connect.php";
$res=$conn->query("SELECT * FROM `марка`")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>