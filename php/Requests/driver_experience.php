<?
include_once "../connect.php";
$res=$conn->query("CALL `Стаж_водителей`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>