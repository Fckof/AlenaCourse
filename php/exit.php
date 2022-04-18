<?
session_start();
include_once "connect.php";
	$_SESSION["user"]="GUEST";
header("Location: ../index.php");
?>