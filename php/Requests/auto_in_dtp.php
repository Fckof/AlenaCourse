<?
include_once "../connect.php";
$res=$conn->query("CALL `Сколько_авто_участ_в_ДТП`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>