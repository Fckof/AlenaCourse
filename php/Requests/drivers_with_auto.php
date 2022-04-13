<?
include_once "../connect.php";
$res=$conn->query("CALL `Водители_со_своим_авто`();")->fetch_all(MYSQLI_ASSOC);
echo json_encode($res);
?>