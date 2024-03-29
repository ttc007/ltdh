function renderScreen(scrTitle){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#screenTitle").html(scrTitle);

	
	$("#app").empty();
	
	$("#app").append(`
		<div class='' id='listQuestion'>
			<div class='row'>
				<div class='col-md-7'>
					<select name='chapterFilter' class='form-control'>
						<option value=''></option>
					</select>
				</div>
				<div class='col-md-5'>
					<button class='btn btn-info' onclick='filterQuestion("`+scrTitle+`")'><i class='fa fa-search'></i></button>
					<button class='btn btn-primary' onclick='renderQuestForm("`+scrTitle+`")'><i class='fa fa-plus'></i></button>
				</div>
			</div>
			<div>
				<ul id='paginateUl'></ul>
			</div>
			<table class='table table-bordered mt-3'>
				<tr>
					<th>No</th>
					<th>Subject</th>
					<th>Chapter</th>
					<th>Type</th>
					<th>Level</th>
					<th>Question</th>
					<th>Choose</th>
					<th></th>
				</tr>
				<tbody id='tableQuestion'></tbody>
			</table>
		</div>
	`);
	
	$.ajax({
		url:"api/listChapter.php",
		type:"GET",
		async:false,
		data:{
			subject:scrTitle
		},
		dataType:'json',
		success:function(data){
			$.each(data, function(i, chapter){
				$("[name=chapterFilter]").append(`
					<option value='`+chapter.chapter+`'>`+chapter.name+`</option>
				`);
			});
		}
	});

	filterQuestion(scrTitle, 'noLoader');
	setTimeout(function(){
		loader.remove();
	},200);
}

function filterQuestion(scrTitle, noLoader){
	if(noLoader!='noLoader'){
		var loader = $("<div class='overlay'><div class='loader'></div></div>");
		$("body").append(loader);
		setTimeout(function(){
			loader.remove();
		}, 300);
	}

	$.ajax({
		url:"api/listQuestion.php",
		type:"GET",
		data:{
			subject:scrTitle,
			chapter:$("[name=chapterFilter]").val()
		},
		dataType:'json',
		success:function(data){
			$("#tableQuestion").empty();
			$.each(data , function(i, v){
				var isShow = "none";
				if(i<10) isShow = 'table-row';

				pageno = parseInt(i/10)+1;
				$("#tableQuestion").append(`
					<tr style='display:`+isShow+`' pageno='`+pageno+`' class='trRow'>
						<td>`+(i+1)+`</td>
						<td>`+v.subject+`</td>
						<td>`+v.chapter+`</td>
						<td>`+v.type+`</td>
						<td>`+v.level+`</td>
						<td>`+v.question+`</td>
						<td>`+v.choose+`</td>
						<td class='text-center'><a class='btn btn-info text-white' onclick='renderQuestForm("`+scrTitle+`", `+v.id+`)' href='#'>Edit</a></td>
					</tr>
				`);
			});
			if(data.length>10) {
				renderPaginate(parseInt(data.length/10)+1);
				if($("#app").attr("pageno")!=undefined){
					choosePage($("#app").attr("pageno"), 'noLoader');
				}
			}
		}
	});
}
function renderPaginate(pageLength){
	for (var i = 1; i <= pageLength; i++) {
		var active = "";
		if( i == 1) active = 'active';
		var li = $(`<li class='paginateLi `+active+`' pageno='`+i+`' onclick='choosePage(`+i+`)'>`+i+`</li>`);
		$("#paginateUl").append(li);
	}
}
function choosePage(pageno, noLoader){
	if(noLoader!='noLoader'){
		var loader = $("<div class='overlay'><div class='loader'></div></div>");
		$("body").append(loader);
		setTimeout(function(){
			loader.remove();
		}, 300);
	}
	$(".paginateLi").removeClass('active');
	$(".paginateLi[pageno="+pageno+"]").addClass('active');
	$(".trRow").css("display", 'none');
	$(".trRow[pageno="+pageno+"]").css("display", 'table-row');
	$("#app").attr('pageno', pageno);
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
					
				</select>
			</div>
			<div class="form-group">
				<label for="pwd">Type</label>
				<select name='type' class='form-control'>
					<option>Exercise</option>
					<option>Theory</option>
				</select>
			</div>
			<div class="form-group">
				<label for="pwd">Level</label>
				<select name='level' class='form-control'>
					<option value='0'>0</option>
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
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
					<option value='0'>A</option>
					<option value='1'>B</option>
					<option value='2'>C</option>
					<option value='3'>D</option>
				</select>
			</div>
			<a class="btn btn-info text-white" onclick='createQuestion("`+scrTitle+`")'>Add / Update</a>
			<a class="btn btn-warning text-white" onclick='renderScreen("`+scrTitle+`")'>Back</a>

		</form>
	`);

	$.ajax({
		url:"api/listChapter.php",
		type:"GET",
		async:false,
		data:{
			subject:scrTitle
		},
		dataType:'json',
		success:function(data){
			$.each(data, function(i, chapter){
				$("[name=chapter]").append(`
					<option value='`+chapter.chapter+`'>`+chapter.name+`</option>
				`);
			});
		}
	});
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
				$("[name=type]").val(data.type).change();
				$("[name=choose]").val(data.choose).change();
				$("[name=level]").val(data.level).change();
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
			type:$("[name=type]").val(),
			level:$("[name=level]").val(),
			chapter:$("[name=chapter]").val(),
			question: CKEDITOR.instances['question'].getData(),
			answer:CKEDITOR.instances['answer'].getData(),
		},
		success:function(data){
			renderScreen(scrTitle);
		}
	});
}
