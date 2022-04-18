
$(".update_number").click(function () { 
	$(".main").html("<h2>Обновить номер</h2>")
	$(".main").append(`
		<form action="php/Change/update_number.php" method="POST" class="container update_form update_number">
			<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">ID авто</label>
			<input type="number" class="form-control id"  min="1" id="formGroupExampleInput" placeholder="Пример: 1" required >
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">Новый номер</label>
			<input type="text" class="form-control num" id="formGroupExampleInput2" placeholder="Пример: R450HH540" required>
		</div>
		<button type="submit" class="btn btn-success w-100 mt-4">Обновить</button>
		</form>
	`);
	
});

$(".main").on("submit",".update_number", function (e) {
	e.preventDefault();
	var idVal=$(".id").val();
	var numVal=$(".num").val();
	$.post("./php/Change/update_number.php", {id:idVal,num:numVal},
		function (data) {
			alert(data)
		},
		"html"
	);
});



$(".update_color").click(function () { 
	$(".main").html("<h2>Обновить цвет</h2>")
	$(".main").append(`
		<form action="php/Change/update_color.php" method="POST" class="container update_form update_color">
			<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">ID авто</label>
			<input type="number" class="form-control id"  min="1" id="formGroupExampleInput" placeholder="Пример: 1" required >
		</div>
		<label for="sel" class="form-label">Цвет</label>
		<select class="form-select" id="sel" required>
			<option selected>Выберите цвет</option>
		</select>
		<button type="submit" class="btn btn-success w-100 mt-4">Обновить</button>
		</form>
	`);
	$.get("./php/Tables/auto_color.php",
		function (data) {
			data.forEach(e => {
				$(".form-select").append(`
				<option value="${e.ID_цвета}">${e.Цвет}</option>
				`);
			});
		},
		"json"
	);
	
});

$(".main").on("submit",".update_color", function (e) {
	e.preventDefault();
	var idVal=$(".id").val();
	var colorVal=$(".form-select").val();
	$.post("./php/Change/update_color.php", {id:idVal,color:colorVal},
		function (data) {
			alert(data)
		},
		"html"
	);
});

$(".add_sheriff").click(function () { 
	$(".main").html("<h2>Добавить следователя</h2>")
	$(".main").append(`
		<form  class="container update_form add_sheriff">
			<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">Фамилия</label>
			<input type="text" class="form-control name" id="formGroupExampleInput"  required >
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">Имя</label>
			<input type="text" class="form-control sname" id="formGroupExampleInput2"  required>
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput3" class="form-label">Отчество</label>
			<input type="text" class="form-control fname" id="formGroupExampleInput3"  required>
		</div>
		<button type="submit" class="btn btn-success w-100 mt-4">Обновить</button>
		</form>
	`);
	
});

$(".main").on("submit",".add_sheriff", function (e) {
	e.preventDefault();
	var nameVal=$(".name").val();
	var surnameVal=$(".sname").val();
	var fathernameVal=$(".fname").val();
	$.post("./php/Change/add_sheriff.php", {name:nameVal,surname:surnameVal,fathername:fathernameVal},
		function (data) {
			alert(data)
		},
		"html"
	);
});


$(".delete_sheriff").click(function () { 
	$(".main").html("<h2>Удалить следователя</h2>")
	$(".main").append(`
		<form  class="container update_form delete_sheriff">
			<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">ID следователя</label>
			<input type="number" class="form-control id" id="formGroupExampleInput"  required >
		</div>
		<button type="submit" class="btn btn-success w-100 mt-4">Обновить</button>
		</form>
	`);
	
});

$(".main").on("submit",".delete_sheriff", function (e) {
	e.preventDefault();
	var idVal=$(".id").val();
	$.post("./php/Change/delete_sheriff.php", {id:idVal},
		function (data) {
			alert(data)
		},
		"html"
	);
});