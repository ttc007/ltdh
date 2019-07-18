<?php
	include("db.php");

	$id = filter_input(INPUT_GET, 'id');

	if($id){
		$sql= "SELECT * FROM questions WHERE id = :id";

		$stmt = $db->prepare($sql); 
		$stmt->bindValue(':id', $id);
		$stmt->execute();
		$row =$stmt->fetchObject();
	} else {
		$subject = filter_input(INPUT_GET, 'subject');

		$sql= "SELECT * FROM questions WHERE subject = :subject ORDER BY RAND()";

		$stmt = $db->prepare($sql); 
		$stmt->bindValue(':subject', $subject);
		$stmt->execute();
		$row =$stmt->fetchObject();
	}

	echo(json_encode($row));
	
?>