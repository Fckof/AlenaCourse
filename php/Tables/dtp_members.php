<?
include_once "../connect.php";
$res=$conn->query("SELECT * FROM `участники_дтп`")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>