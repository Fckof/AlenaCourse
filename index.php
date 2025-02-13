<?
session_start();
if (!isset($_SESSION["user"])) {
	$_SESSION["user"] = "GUEST";
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<title>ДТП</title>
</head>

<body>
	<!-- Modal -->
	<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Авторизация</h5>
					<button type="button" class="close" data-bs-dismiss="modal" aria-bs-label="Close">
						<span aria-bs-hidden="true">&times;</span>
					</button>
				</div>
				<form class="login-form" action="php/auth.php" method="POST">
					<div class="modal-body">
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">Логин</label>
							<input type="text" class="form-control" name="login" id="formGroupExampleInput">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput2" class="form-label">Пароль</label>
							<input type="password" class="form-control" name="pass" id="formGroupExampleInput2">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
						<button type="submit" class="btn btn-primary btn-lg">Войти</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.php">Главная</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<div class="container">
						<ul class="navbar-nav">
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Таблицы
								</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item marks" href="#">Марка</a></li>
									<li><a class="dropdown-item DTP" href="#">ДТП</a></li>
									<li><a class="dropdown-item categories" href="#">Категории</a></li>
									<li><a class="dropdown-item auto" href="#">Авто</a></li>
									<li><a class="dropdown-item auto_owners" href="#">Владельцы авто</a></li>
									<li><a class="dropdown-item drivers" href="#">Водители</a></li>
									<li><a class="dropdown-item sheriffs" href="#">Следователи</a></li>
									<li><a class="dropdown-item dtp_members" href="#">Участники ДТП</a></li>
									<li><a class="dropdown-item auto_color" href="#">Цвет авто</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Запросы
								</a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item owners_withno_license" href="#">Владельцы без прав</a></li>
									<li><a class="dropdown-item drivers_in_dtp" href="#">Водители участвовавшие в ДТП</a></li>
									<li><a class="dropdown-item dtp_count" href="#">Кол-во ДТП у водителя</a></li>
									<li><a class="dropdown-item drivers_with_auto" href="#">Водители со своим авто</a></li>
									<li><a class="dropdown-item dtp_with_injures" href="#">ДТП с пострадавшими</a></li>
									<li><a class="dropdown-item dtp_in_tver" href="#">Кол-во ДТП в Тверской области</a></li>
									<li><a class="dropdown-item deals_policemen" href="#">Кол-во рассмотренных дел у следователя</a></li>
									<li><a class="dropdown-item auto_in_dtp" href="#">Кол-во авто участвовавших в ДТП</a></li>
									<li><a class="dropdown-item drivers_experience" href="#">Стаж водителей</a></li>
									<li><a class="dropdown-item auto_before_2000" href="#">Учет авто до 2000г</a></li>
								</ul>
							</li>
							<? if ($_SESSION["user"] == "ADMIN" or $_SESSION["user"] == "WORKER") : ?>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Отчеты
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item d_categories" href="#">Отчет "Граф категорий водителей"</a></li>
										<li><a class="dropdown-item dtp_year" href="#">Отчет "Сколько пострадало в ДТП за опр год"</a></li>
										<li><a class="dropdown-item auto_year" href="#">Отчет "Учет авто за опр год"</a></li>
									</ul>
								</li>
							<? endif; ?>
							<? if ($_SESSION["user"] == "ADMIN") : ?>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
										Администрирование
									</a>
									<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item add_sheriff" href="#">Добавить следователя</a></li>
										<li><a class="dropdown-item delete_sheriff" href="#">Удалить следователя</a></li>
										<li><a class="dropdown-item update_color" href="#">Обновить цвет авто</a></li>
										<li><a class="dropdown-item update_number" href="#">Обновить номер авто</a></li>
									</ul>
								</li>
							<? endif; ?>
						</ul>

					</div>
					<div class="d-flex me-3">
						<h3 class="user m-2 me-5"><? echo $_SESSION["user"]; ?></h3>
						<!-- <button type="button" class="btn btn-danger btn-lg">Выйти</button> -->
						<? if ($_SESSION["user"] == "GUEST") : ?>
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
								Войти
							</button>
						<? endif; ?>
						<? if ($_SESSION["user"] != "GUEST") : ?>
							<form action="php/exit.php " class="d-flex">
								<button type="submit" class="btn btn-danger">
									Выйти
								</button>
							</form>
						<? endif; ?>
					</div>

				</div>
			</div>
		</nav>
	<div class="container">
		

		<div class="main p-2 mt-4 me-3 ms-3">
			<h1 class="m-5">Добро пожаловать на сайт</h1>
			<h2 class="m-4">Чтобы начать просмотр данных выберите категорию в меню</h2>
			
			<div class="spinner-border m-5" style="width: 15rem; height: 15rem;" role="status">
	<span class="visually-hidden">Загрузка...</span>
  </div>
  <h1 class="m-4">Для расширенных возможностей авторизуйтесь</h1>
		</div>
	</div>

	<script src="jquery/jquery-min.js"></script>
	<script src="bootstrap/bootstrap.bundle.js"></script>
	<script src="js/showTables.js"></script>
	<script src="js/showRequests.js"></script>
	<script src="js/showForm.js"></script>
	<script src="js/modifyData.js"></script>
	<script src="js/script.js"></script>
	<script src="node_modules/chart.js/dist/chart.js"></script>

</body>

</html>