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