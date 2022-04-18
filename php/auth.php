<?
session_start();
include_once "connect.php";
$login=$_POST["login"];
$pass=$_POST["pass"];
$res=$conn->query("SELECT * FROM `пользователи` WHERE `login`='$login' and `pass`='$pass'")->fetch_assoc();
if($res){
	$_SESSION["user"]=$res["role"];
}
header("Location: ../index.php");
?>