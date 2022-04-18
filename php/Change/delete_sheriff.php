<?
include_once "../connect.php";
$id=$_POST['id'];
$res=$conn->query("CALL `удалить_следователя`('$id');");
if($res){
	echo "Данные удалены";
}
else echo "Ошибка";
?>