<?
include_once "../connect.php";
$res=$conn->query("CALL `Сколько_ДТП_рассмотрел_следователь`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>