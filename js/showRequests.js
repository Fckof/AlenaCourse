//запрос Владельцы авто без прав
$(".owners_withno_license").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/owners_withno_license.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Владельцы авто без прав"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
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

//запрос Владельцы авто без прав
$(".drivers_in_dtp").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/drivers_wasin_dtp.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Водители участвовавшие в ДТП"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
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

//запрос кол-во дтп
$(".dtp_count").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/drivers_wasin_dtp_count.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Водители участвовавшие в ДТП кол-во"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
				<th scope="col">ДТП</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Фамилия}</td>
				  <td>${el.Имя}</td>
				  <td>${el.Отчество}</td>
				  <td>${el.ДТП}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".drivers_with_auto").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/drivers_with_auto.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Водители с авто"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
				<th scope="col">Марка</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Фамилия}</td>
				  <td>${el.Имя}</td>
				  <td>${el.Отчество}</td>
				  <td>${el.Марка}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".dtp_with_injures").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/dtp_with_hurts.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "ДТП с пострадавшими"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Дата</th>
				<th scope="col">Место</th>
				<th scope="col">Пострадали</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Дата}</td>
				  <td>${el.Место}</td>
				  <td>${el.Пострадали}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".dtp_in_tver").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/dtp_in_tverobl.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "ДТП в Тверской области"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Место</th>
				<th scope="col">ДТП</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Место}</td>
				  <td>${el.ДТП}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".deals_policemen").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/sheriff_dtp_checked.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Сколько дел рассмотрел следователь"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
				<th scope="col">ДТП</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Фамилия}</td>
				  <td>${el.Имя}</td>
				  <td>${el.Отчество}</td>
				  <td>${el.ДТП}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".auto_in_dtp").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/auto_in_dtp.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Авто были в ДТП"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Марка</th>
				<th scope="col">ДТП</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Марка}</td>
				  <td>${el.ДТП}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".auto_in_dtp").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/auto_in_dtp.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Кол-во авто участвовавших в ДТП"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Марка</th>
				<th scope="col">ДТП</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Марка}</td>
				  <td>${el.ДТП}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".drivers_experience").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/driver_experience.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Стаж водителей"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Фамилия</th>
				<th scope="col">Имя</th>
				<th scope="col">Отчество</th>
				<th scope="col">Дата_выдачи_уд</th>
				<th scope="col">Лет</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Фамилия}</td>
				  <td>${el.Имя}</td>
				  <td>${el.Отчество}</td>
				  <td>${el.Дата_выдачи_уд}</td>
				  <td>${el.Лет}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});

//запрос водители с авто
$(".auto_before_2000").click(function () { 
	lazyLoad()
	$.ajax({
		type: "GET",
		url: "./php/Requests/auto_before_2000.php",
		dataType: "json",
		success: function (data) {
			console.log(data)
			$(".main").html(`<h1 class="mb-4"> Запрос "Учет авто до 2000г"</h1>`);
			$(".main").append(`
			<table class="table table-striped table-hover">
			<thead>
			  <tr>
				<th scope="col">Марка</th>
				<th scope="col">Цвет</th>
				<th scope="col">Дата_постановки_на_учет</th>
			  </tr>
			</thead>
			<tbody class="tbody">
				`);
			data.forEach(el => {
				$(".tbody").append(`
				<tr>
				  <td>${el.Марка}</td>
				  <td>${el.Цвет}</td>
				  <td>${el.Дата_постановки_на_учет}</td>
				</tr>
				`);
			});
			$(".main").append(`</tbody></table>`);
		}
	});
});