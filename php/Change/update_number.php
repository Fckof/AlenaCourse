<?
include_once "../connect.php";
$id=$_POST['id'];
$num=$_POST['num'];
$res=$conn->query("CALL `обновить_номер_авто`('$id','$num');");
if($res){
	echo "Данные обновлены";
}
else echo "Ошибка";
?>