<?
include_once "../connect.php";
$res=$conn->query("CALL `Отчет_сколько_пострадало_в_ДТП_за_опр_год`();");

$arrYear=Array();
$arrPostr=Array();
$arrDead=Array();
while($row=$res->fetch_assoc()){
	$arrYear[]=$row["Год"];
	$arrPostr[]=$row["пострадало"];
	$arrDead[]=$row["погибло"];
}
$mainArr=array($arrYear,$arrPostr, $arrDead);
//echo var_dump($mainArr);
echo json_encode($mainArr);
?>