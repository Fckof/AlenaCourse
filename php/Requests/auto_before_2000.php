<?
include_once "../connect.php";
$res=$conn->query("CALL `Учет_авто_до_2000г`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>