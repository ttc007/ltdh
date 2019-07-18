<?php
	include('db.php');
	$dataPost = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

	if(isset($_POST['question'])){
		$question = $_POST['question'];
		$answer = $_POST['answer'];
	}

	if($dataPost['id'] > 0) {
		$sql = $sql = "UPDATE questions SET 
				subject = :subject, 
	            chapter = :chapter, 
	            question = :question,  
	            answer = :answer,  
	            choose = :choose  
	            WHERE id = :id";
		$stmt= $db->prepare($sql);
		$stmt->bindValue(':id', $dataPost['id']);
		$stmt->bindValue(':subject', $dataPost['subject']);
		$stmt->bindValue(':chapter', $dataPost['chapter']);
		$stmt->bindValue(':question', $question);
		$stmt->bindValue(':answer', $answer);
		$stmt->bindValue(':choose', $dataPost['choose']);
		$stmt->execute();
	} else {
		$sql = "INSERT INTO questions (subject, chapter, question, answer, choose) VALUES (?,?,?,?,?)";
		$stmt= $db->prepare($sql);
		$stmt->execute([$dataPost['subject'], $dataPost['chapter'], urlencode($dataPost['question']),
				urlencode($dataPost['answer'],$dataPost['choose'])]);
	}
	
	echo(json_encode($dataPost));
	echo ($_POST['question']);
?>