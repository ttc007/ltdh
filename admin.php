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
	<script src="ckeditor/ckeditor.js"></script>

	<script src="js/admin.js"></script>
	<script src="js/adminChapter.js"></script>
	<link rel="stylesheet" href="css/main.css">

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-bottom">
		<ul class="navbar-nav">
			<li class="nav-item">
			  	<a class="nav-link" href=""><span class="fa fa-home"></span></a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('Chemistry')">Chemistry</a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('Physics')">Physics</a>
			</li>
			<li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('Math')">Math</a>
			</li>
			<!-- <li class="nav-item">
			  	<a class="nav-link" href="#" onclick="renderScreen('', 'Nhờ giải hộ')">Nhờ giải hộ</a>
			</li> -->
		</ul>
	</nav>
	<div class="jumbotron text-center">
	  <h1 id='screenTitle'>Admin Page</h1>
	  <p>Resize this responsive page to see the effect!</p> 
	</div>
	<div id='app' class="container">
		<div class='card-columns' style="column-count:2">
			<div class="card bg-light text-dark text-center" onclick="renderScreen('Chemistry')">
			    <div class="card-body">
			    	<h3>Chemistry</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center" onclick="renderScreen('Math')">
			    <div class="card-body">
			    	<h3>Math</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center" onclick="renderScreen('Physics')">
			    <div class="card-body">
			    	<h3>Physics</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center" onclick="renderScreen('Bot')">
			    <div class="card-body">
			    	<h3>Relief valve</h3>
			    </div>
		    </div>
		    <div class="card bg-light text-dark text-center" onclick="renderScreenChapter()">
			    <div class="card-body">
			    	<h3>Chapter</h3>
			    </div>
		    </div>
		</div>
	</div>
</body>
</html>