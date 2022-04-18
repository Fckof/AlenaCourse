$(".d_categories").click(function () {

$.ajax({
	type: "GET",
	url: "./php/Forms/form_cat.php",
	dataType: "json",
	success: function (data) {
		$(".main").html(`<h1 class="mb-4"> Отчет "Категории водителей"</h1>`);
		$(".main").append(`
		<div class="pie">
		<canvas id="myChart" width="200" height="200"></canvas>
		</div>
		`)
		const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: data[0],
        datasets: [{
            label: 'Кол-во',
            data: data[1],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {

    }
});
	}
});
});


$(".dtp_year").click(function () {
	$.ajax({
		type: "GET",
		url: "./php/Forms/form_dtp_year.php",
		dataType: "json",
		success: function (data) {
			$(".main").html(`<h1 class="mb-4"> Отчет "Пострадавшие в ДТП"</h1>`);
			$(".main").append(`
			<div class="line">
			<canvas id="myChart" width="200" height="200"></canvas>
			</div>
			`)
			console.log(data)
			const ctx = document.getElementById('myChart').getContext('2d');
	const myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: data[0],
			datasets: [{
				label: 'Пострадало',
				data: data[1],
				borderColor:'rgba(255, 99, 132, 1)',
				borderWidth: 1
			},
			{
				label: 'Погибло',
				data: data[2],
				borderColor:'rgba(54, 162, 235, 1)',
				borderWidth: 1
			}
		]
		}
	});
		}
	});
	});


	$(".auto_year").click(function () {

		$.ajax({
			type: "GET",
			url: "./php/Forms/form_auto_year.php",
			dataType: "json",
			success: function (data) {
				$(".main").html(`<h1 class="mb-4"> Отчет "Учет авто"</h1>`);
				$(".main").append(`
				<div class="pie">
				<canvas id="myChart" width="200" height="200"></canvas>
				</div>
				`)
				const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: data[0],
				datasets: [{
					label: 'Кол-во',
					data: data[1],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
		
			}
		});
			}
		});
		});
		