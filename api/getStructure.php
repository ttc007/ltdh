<?php
	include("db.php");

	$subject = filter_input(INPUT_GET, 'subject');

	$sql= "SELECT * FROM structures WHERE subject = :subject";

	$stmt = $db->prepare($sql); 
	$stmt->bindValue(':subject', $subject);
	$stmt->execute();
	$row = $stmt->fetchObject();
	echo(json_encode($row->structure));
?>