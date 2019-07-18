<?php
	include("db.php");

	$subject = filter_input(INPUT_GET, 'subject');
	$sql= "SELECT * FROM questions WHERE subject = :subject";

	$stmt = $db->prepare($sql); 
	$stmt->bindValue(':subject', $subject);
	$stmt->execute();
	$row =$stmt->fetchAll(PDO::FETCH_OBJ);
	echo(json_encode($row));
?>