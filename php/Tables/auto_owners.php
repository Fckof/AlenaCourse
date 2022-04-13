<?
include_once "../connect.php";
$res=$conn->query("SELECT * FROM `владельцы_авто`")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>