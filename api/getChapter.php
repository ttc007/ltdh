<?php
	include("db.php");

	$id = filter_input(INPUT_GET, 'id');

	if($id){
		$sql= "SELECT * FROM chapters WHERE id = :id";

		$stmt = $db->prepare($sql); 
		$stmt->bindValue(':id', $id);
		$stmt->execute();
		$row =$stmt->fetchObject();
	}

	echo(json_encode($row));
	
?>