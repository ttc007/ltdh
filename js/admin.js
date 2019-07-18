function renderScreen(scrTitle){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#screenTitle").html(scrTitle);
	$("#app").empty();
	
	$("#app").append(`
		<div class='row' id='listQuestion'>
			<button class='btn btn-info' onclick='renderQuestForm("`+scrTitle+`")'>Thêm</button>
			<table class='table table-bordered mt-3'>
				<tr>
					<th>Subject</th>
					<th>Chapter</th>
					<th>Question</th>
					<th>Choose</th>
					<th></th>
				</tr>
				<tbody id='tableQuestion'></tbody>
			</table>
		</div>
	`);
	$.ajax({
		url:"api/listQuestion.php",
		type:"GET",
		data:{
			subject:scrTitle
		},
		dataType:'json',
		success:function(data){
			$.each(data , function(i, v){
				$("#tableQuestion").append(`
					<tr>
						<td>`+v.subject+`</td>
						<td>`+v.chapter+`</td>
						<td>`+v.question+`</td>
						<td>`+v.choose+`</td>
						<td class='text-center'><a class='btn btn-info text-white' onclick='renderQuestForm("`+scrTitle+`", `+v.id+`)' href='#'>Edit</a></td>
					</tr>
				`);
			});
		}
	});
	
	
	
	setTimeout(function(){
		loader.remove();
	},200);
}

function renderQuestForm(scrTitle, id){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#app").empty();
	$("#app").append(`
		<form action="" method='post' id='createQuestionForm'>
			<h3 id='formIdTitle'></h3>
			<input type='hidden' name='id' value='0' />
			<input type='hidden' name='subject' value='`+scrTitle+`' />
			<div class="form-group">
				<label for="email">Chapter</label>
				<select name='chapter' class='form-control'>
					<option value='1'>Chương 1</option>
					<option value='2'>Chương 2</option>
					<option value='3'>Chương 3</option>
					<option value='4'>Chương 4</option>
					<option value='5'>Chương 5</option>
					<option value='6'>Chương 6</option>
					<option value='7'>Chương 7</option>
					<option value='8'>Chương 8</option>
				</select>
			</div>
			<div class="form-group">
				<label for="pwd">Question</label>
				<textarea class="form-control" name='question' id='question' rows='10'></textarea>
			</div>
			<div class="form-group">
				<label for="pwd">Answer</label>
				<textarea class="form-control" name='answer' id='answer' rows='10'></textarea>
			</div>
			<div class="form-group">
				<label for="pwd">Choose</label>
				<select name='choose' class='form-control'>
					<option value='A'>A</option>
					<option value='B'>B</option>
					<option value='C'>C</option>
					<option value='D'>D</option>
				</select>
			</div>
			<a class="btn btn-info text-white" onclick='createQuestion("`+scrTitle+`")'>Add / Update</a>
			<a class="btn btn-warning text-white" onclick='renderScreen("`+scrTitle+`")'>Back</a>

		</form>
	`);

	CKEDITOR.replace( 'question' );
	CKEDITOR.replace( 'answer' );
	if(id!=undefined){
		$.ajax({
			url:"api/getQuestion.php",
			type:"GET",
			data:{
				id:id
			},
			async:false,
			dataType:'json',
			success:function(data){
				$("#formIdTitle").html("ID Question: "+ id);
				$("[name=id]").val(data.id);
				$("[name=chapter]").val(data.chapter).change();
				$("[name=choose]").val(data.choose).change();
				CKEDITOR.instances['question'].setData(data.question);
				CKEDITOR.instances['answer'].setData(data.answer);
			}
		});	
	}
	
	
	setTimeout(function(){
		loader.remove();
	}, 200);
}

function createQuestion(scrTitle){
	$.ajax({
		url:"api/createQuestion.php",
		type:"POST",
		data:{
			id:$("[name=id]").val(),
			subject:$("[name=subject]").val(),
			choose:$("[name=choose]").val(),
			chapter:$("[name=chapter]").val(),
			question: CKEDITOR.instances['question'].getData(),
			answer:CKEDITOR.instances['answer'].getData(),
		},
		success:function(data){
			renderScreen(scrTitle);
		}
	});
}
