<?php
	$username = "eccubev4";
	$password = "12345678";
	
	try {
	    $db = new PDO("mysql:host=localhost;dbname=ltdh;charset=utf8", $username, $password);
	    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}catch(PDOException $e){
	    var_dump($e->getMessage());
	}
?>