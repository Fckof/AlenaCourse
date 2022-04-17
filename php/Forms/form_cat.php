<?
include_once "../connect.php";
$res=$conn->query("CALL `Отчет_граф_категории_водителей`();");//->fetch_all(MYSQLI_ASSOC);

$arrName=Array();
$arrValue=Array();
while($row=$res->fetch_assoc()){
	$arrName[]=$row["Категория"];
	$arrValue[]=$row["Кол-во"];
}
$mainArr=array($arrName, $arrValue);
//echo var_dump($mainArr);
echo json_encode($mainArr);
?>