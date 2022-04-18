<?
include_once "../connect.php";
$surname=$_POST['surname'];
$name=$_POST['name'];
$fathername=$_POST['fathername'];
$res=$conn->query("CALL `добавить_следователя`('$name','$surname','$fathername');");
if($res){
	echo "Данные добавлены";
}
else echo "Ошибка";
?>