<?php
	include('db.php');
	$dataPost = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

	if($dataPost['id'] > 0) {
		$sql = $sql = "UPDATE chapters SET 
				subject = :subject, 
	            chapter = :chapter, 
	            name = :name
	            WHERE id = :id";
		$stmt= $db->prepare($sql);
		$stmt->execute(
			[
				"id" => $dataPost['id'],
				"subject" => $dataPost['subject'],
				"chapter" => $dataPost['chapter'],
				"name" => $dataPost['name']
			]
		);
	} else {
		$sql = "INSERT INTO chapters (subject, chapter, name) VALUES (:subject,:chapter,:name)";
		$stmt= $db->prepare($sql);
		$stmt->execute(
			[
				"subject" => $dataPost['subject'],
				"chapter" => $dataPost['chapter'],
				"name" => $dataPost['name']
			]
		);
	}
	
	echo(json_encode($dataPost['name']));
?>