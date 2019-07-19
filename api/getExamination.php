<?php
	include("db.php");

	$result = array();
	$subject = filter_input(INPUT_GET, 'subject');
	$chapter = filter_input(INPUT_GET, 'chapter');
	$type = filter_input(INPUT_GET, 'type');
	$amount = filter_input(INPUT_GET, 'amount');

	$sql= "SELECT question FROM questions WHERE subject = :subject AND chapter=:chapter AND type=:type LIMIT $amount";
	$stmt = $db->prepare($sql);
	$stmt->execute(
		[
			'subject'=>$subject,
			'chapter'=>$chapter,
			'type'=>$type
		]
	);
	$rows =$stmt->fetchAll(PDO::FETCH_OBJ);
	echo(json_encode($rows));
?>
