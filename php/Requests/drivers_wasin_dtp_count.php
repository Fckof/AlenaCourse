<?
include_once "../connect.php";
$res=$conn->query("CALL `Водители_в_ДТП_колво`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>