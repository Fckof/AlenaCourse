//спиннер загрузки
function lazyLoad(){
	$(".main").html("");
	$(".main").append(`<div class="spinner-border m-5" style="width: 3rem; height: 3rem;" role="status">
	<span class="visually-hidden">Загрузка...</span>
  </div>`);
}

//ссылка марки
$(".marks").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/marks.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Марки"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_марки</th>
				<th scope="col">Марка</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.ID_марки}</td>
				  <td>${el.Марка}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка дтп
$(".DTP").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/DTP.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "ДТП"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_дтп</th>
				<th scope="col">Дата</th>
				<th scope="col">Место</th>
				<th scope="col">Пострадало, чел</th>
				<th scope="col">Погибло, чел</th>
				<th scope="col">Описание</th>
				<th scope="col">ID_лиц_проводившего_расслед</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				<td scope="col">${el.ID_дтп}</td>
				<td scope="col">${el.Дата}</td>
				<td scope="col">${el.Место}</td>
				<td scope="col">${el.Пострадало}</td>
				<td scope="col">${el.Погибло}</td>
				<td scope="col">${el.Описание}</td>
				<td scope="col">${el.ID_лиц_проводившего_расслед}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка категории
$(".categories").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/category.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Категории"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_категории</th>
				<th scope="col">Категория</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.ID_категории}</td>
				  <td>${el.Категория}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка авто
$(".auto").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/auto.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Автомобили"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_авто</th>
				<th scope="col">ID_марки</th>
				<th scope="col">ID_цвета</th>
				<th scope="col">Номер_гос_рег</th>
				<th scope="col">Номер_двигателя</th>
				<th scope="col">Номер_кузова</th>
				<th scope="col">Номер_шасси</th>
				<th scope="col">Номер_тех_талона</th>
				<th scope="col">Дата_выдачи_тех_талона</th>
				<th scope="col">Дата_постановки_на_учет</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				<td scope="col">${el.ID_авто}</td>
				<td scope="col">${el.ID_марки}</td>
				<td scope="col">${el.ID_цвета}</td>
				<td scope="col">${el.Номер_гос_рег}</td>
				<td scope="col">${el.Номер_двигателя}</td>
				<td scope="col">${el.Номер_кузова}</td>
				<td scope="col">${el.Номер_шасси}</td>
				<td scope="col">${el.Номер_тех_талона}</td>
				<td scope="col">${el.Дата_выдачи_тех_талона}</td>
				<td scope="col">${el.Дата_постановки_на_учет}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка владельцы авто
$(".auto_owners").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/auto_owners.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Владельцы авто"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_владельца</th>
				<th scope="col">ID_авто</th>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
				<th scope="col">Номер_вод_уд</th>
				<th scope="col">Дата_регистрации_транспорта</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				<td scope="col">${el.ID_владельца}</td>
				<td scope="col">${el.ID_авто}</td>
				<td scope="col">${el.Фамилия}</td>
				<td scope="col">${el.Имя}</td>
				<td scope="col">${el.Отчество}</td>
				<td scope="col">${el.Номер_вод_уд}</td>
				<td scope="col">${el.Дата_регистрации_транспорта}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка водители
$(".drivers").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/drivers.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Водители"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_водителя</th>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
				<th scope="col">Адрес</th>
				<th scope="col">Номер_вод_уд</th>
				<th scope="col">Дата_выдачи_уд</th>
				<th scope="col">ID_категории</th>
				<th scope="col">Дата_регистрации</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				<td scope="col">${el.ID_водителя}</td>
				<td scope="col">${el.Фамилия}</td>
				<td scope="col">${el.Имя}</td>
				<td scope="col">${el.Отчество}</td>
				<td scope="col">${el.Адрес}</td>
				<td scope="col">${el.Номер_вод_уд}</td>
				<td scope="col">${el.Дата_выдачи_уд}</td>
				<td scope="col">${el.ID_категории}</td>
				<td scope="col">${el.Дата_регистрации}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка следователи
$(".sheriffs").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/sheriff.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Следователи"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_следователя</th>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.ID_следователя}</td>
				  <td>${el.Фамилия}</td>
				  <td>${el.Имя}</td>
				  <td>${el.Отчество}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка участники дтп
$(".dtp_members").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/dtp_members.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Участники ДТП"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_дтп</th>
				<th scope="col">ID_водителя</th>
				<th scope="col">ID_машины</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.ID_дтп}</td>
				  <td>${el.ID_водителя}</td>
				  <td>${el.ID_машины}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//ссылка цвет авто
$(".auto_color").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Tables/auto_color.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Таблица "Цвет авто"</h1>`);
			$(".main").append(`

			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">ID_цвета</th>
				<th scope="col">Цвет</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.ID_цвета}</td>
				  <td>${el.Цвет}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});