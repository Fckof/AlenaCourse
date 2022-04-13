<?
include_once "../connect.php";
$res=$conn->query("CALL `ДТП_с_пострадавшими`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>