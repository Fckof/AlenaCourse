<?
include_once "../connect.php";
$res=$conn->query("CALL `Отчет_учет_авто_за_опр_год`();");//->fetch_all(MYSQLI_ASSOC);

$arrName=Array();
$arrValue=Array();
while($row=$res->fetch_assoc()){
	$arrYear[]=$row["Год"];
	$arrValue[]=$row["Кол-во авто"];
}
$mainArr=array($arrYear, $arrValue);
//echo var_dump($mainArr);
echo json_encode($mainArr);
?>