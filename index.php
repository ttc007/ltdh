<!DOCTYPE html>
<html>
<head>
	<title>Online exam preparation - Luyện thi online</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

	<script src="js/main.js"></script>
	<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-bottom">
		<ul class="navbar-nav">
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('home', 'Trang chủ')"><span class="fa fa-home"></span></a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('Chemistry', 'Môn Hóa')">Môn Hóa</a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('Physics', 'Môn Lý')">Môn Lý</a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('Math', 'Môn Toán')">Môn Toán</a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('bot', 'Bot')">Bot</a>
			</li>
		</ul>
	</nav>
	<div class="jumbotron text-center">
	  <h1 id='screenTitle'>Trang chủ</h1>
	  <p>Có công mài sắt có ngày nên kim!</p> 
	</div>
	<div id='app' class="container">
		<div class='card-columns' style="column-count:2">
			<div class="card bg-light text-dark text-center"  onclick="renderScreen('Chemistry', 'Môn Hóa')">
			    <div class="card-body">
			    	<h3>Môn Hóa</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center"  onclick="renderScreen('Math', 'Môn Toán')">
			    <div class="card-body">
			    	<h3>Môn Toán</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center"  onclick="renderScreen('Physics', 'Môn Lý')">
			    <div class="card-body">
			    	<h3>Môn Lý</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center"  onclick="renderScreen('bot', 'Bot')">
			    <div class="card-body">
			    	<h3>Bot</h3>
			    </div>
		    </div>
		</div>
	</div>
</body>
</html>