<?
include_once "../connect.php";
$id=$_POST['id'];
$color=$_POST['color'];
$res=$conn->query("CALL `обновить_цвет_авто`('$id','$color');");
if($res){
	echo "Данные обновлены";
}
else echo "Ошибка";
?>