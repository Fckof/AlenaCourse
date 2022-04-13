<?
include_once "../connect.php";
$res=$conn->query("CALL `Владельцы_без_прав`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>