<?
include_once "../connect.php";
$res=$conn->query("CALL `Водилы_были_в_ДТП`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>