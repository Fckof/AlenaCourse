<?
include_once "../connect.php";
$res=$conn->query("CALL `Сколько_ДТП_в_тверской_области`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>