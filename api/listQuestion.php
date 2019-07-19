<?php
	include("db.php");

	$subject = filter_input(INPUT_GET, 'subject');
	$chapter = filter_input(INPUT_GET, 'chapter');

	if($chapter==""){
		$sql= "SELECT * FROM questions WHERE subject = :subject";
		$stmt = $db->prepare($sql);
		$stmt->bindValue(':subject', $subject);
	} else {
		$sql= "SELECT * FROM questions WHERE subject = :subject AND chapter=:chapter";
		$stmt = $db->prepare($sql);
		$stmt->bindValue(':subject', $subject);
		$stmt->bindValue(':chapter', $chapter);
	}
	
	
	$stmt->execute();
	$row =$stmt->fetchAll(PDO::FETCH_OBJ);
	echo(json_encode($row));
?>