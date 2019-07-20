<?php
	include("db.php");

	$subject = filter_input(INPUT_GET, 'subject');

	if($subject==""){
		$sql= "SELECT * FROM chapters";
		$stmt = $db->prepare($sql);
	} else {
		$sql= "SELECT * FROM chapters WHERE subject = :subject";
		$stmt = $db->prepare($sql);
		$stmt->bindValue(':subject', $subject);
	}
	
	
	$stmt->execute();
	$row =$stmt->fetchAll(PDO::FETCH_OBJ);
	echo(json_encode($row));
?>