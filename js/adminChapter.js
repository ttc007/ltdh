function renderScreenChapter(){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#screenTitle").html("Admin Chapter");
	
	

	$("#app").empty();
	$("#app").append(`
		<div class='' id='listChapter'>
			<div class='row'>
				<div class='col-md-7'>
					<select name='subjectFilter' class='form-control'>
						<option></option>
						<option>Chemistry</option>
						<option>Math</option>
						<option>Physics</option>
						<option>Biological</option>
						<option>English</option>
					</select>
				</div>
				<div class='col-md-5'>
					<button class='btn btn-info' onclick='filterChapter()'><i class='fa fa-search'></i></button>
					<button class='btn btn-primary' onclick='renderChapterForm()'><i class='fa fa-plus'></i></button>
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
					<th>Name</th>
					<th>Action</th>
				</tr>
				<tbody id='tableChapter'></tbody>
			</table>
		</div>
	`);

	var subject = $("#app").attr('subject');
	if(subject!=undefined) $("[name=subjectFilter]").val(subject).change();
	setTimeout(function(){
		filterChapter('noLoader');
	},100);
	setTimeout(function(){
		loader.remove();
	},200);
	
}
function filterChapter(noLoader){
	if(noLoader!='noLoader'){
		var loader = $("<div class='overlay'><div class='loader'></div></div>");
		$("body").append(loader);
		setTimeout(function(){
			loader.remove();
		}, 300);
	}

	$.ajax({
		url:"api/listChapter.php",
		type:"GET",
		data:{
			subject:$("[name=subjectFilter]").val(),
		},
		dataType:'json',
		success:function(data){
			$("#tableChapter").empty();
			$.each(data , function(i, v){
				$("#tableChapter").append(`
					<tr>
						<td>`+(i+1)+`</td>
						<td>`+v.subject+`</td>
						<td>`+v.chapter+`</td>
						<td>`+v.name+`</td>
						<td class='text-center'><a class='btn btn-info text-white' onclick='renderChapterForm(`+v.id+`)' href='#'>Edit</a></td>
					</tr>
				`);
			});
		}
	});

	$("#app").attr("subject", $("[name=subjectFilter]").val());
}

function renderChapterForm(id){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#app").empty();
	$("#app").append(`
		<form action="" method='post' id='createQuestionForm'>
			<h3 id='formIdTitle'></h3>
			<input type='hidden' name='id' value='0' />
			<div class="form-group">
				<label for="email">Subject</label>
				<select name='subject' class='form-control'>
					<option>Chemistry</option>
					<option>Math</option>
					<option>Physics</option>
					<option>Biological</option>
					<option>English</option>
				</select>
			</div>
			<div class="form-group">
				<label for="pwd">Chapter</label>
				<input name='chapter' class='form-control' />
			</div>
			<div class="form-group">
				<label for="pwd">Name</label>
				<input name='name' class='form-control' />
			</div>
			<a class="btn btn-info text-white" onclick='createChapter()'>Add / Update</a>
			<a class="btn btn-warning text-white" onclick='renderScreenChapter()'>Back</a>

		</form>
	`);

	var subject = $("#app").attr('subject');
	if(subject!=undefined) $("[name=subject]").val(subject).change();
	if(id!=undefined){
		$.ajax({
			url:"api/getChapter.php",
			type:"GET",
			data:{
				id:id
			},
			async:false,
			dataType:'json',
			success:function(data){
				$("#formIdTitle").html("ID Question: "+ id);
				$("[name=id]").val(data.id);
				$("[name=chapter]").val(data.chapter);
				$("[name=name]").val(data.name);
				$("[name=subject]").val(data.subject).change();
			}
		});	
	}
	
	
	setTimeout(function(){
		loader.remove();
	}, 200);
}
function createChapter(){
	$.ajax({
		url:"api/createChapter.php",
		type:"POST",
		data:{
			id:$("[name=id]").val(),
			subject:$("[name=subject]").val(),
			name:$("[name=name]").val(),
			chapter:$("[name=chapter]").val(),
		},
		success:function(data){
			renderScreenChapter();
		}
	});
}