function renderScreen(scrName, scrTitle){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#screenTitle").html(scrTitle);
	$("#app").empty();
	if(scrName=='home'){
		$("#app").append(`
			<div class='card-columns' style="column-count:2">
				<div class="card bg-light text-dark text-center"  onclick="renderScreen('', 'Môn Hóa')">
				    <div class="card-body">
				    	<h3>Môn Hóa</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center"  onclick="renderScreen('Chemistry', 'Môn Hóa')">
				    <div class="card-body">
				    	<h3>Môn Toán</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center"  onclick="renderScreen('', 'Môn Hóa')">
				    <div class="card-body">
				    	<h3>Môn Lý</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center"  onclick="renderScreen('', 'Môn Hóa')">
				    <div class="card-body">
				    	<h3>Nhờ giải hộ</h3>
				    </div>
			    </div>
			</div>
		`);
	} else {
		$("#app").append(`
			<div class='card-columns'>
				<div class="card bg-light text-dark text-center" onclick='renderExercise("`+scrName+`")'>
				    <div class="card-body" style="padding:3rem">
				    	<h3>Luyện tập</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center" onclick='renderExamination("`+scrName+`")'>
				    <div class="card-body"  style="padding:3rem">
				    	<h3>Thi thử</h3>
				    </div>
			    </div>
			</div>
		`);
	}
	
	
	setTimeout(function(){
		loader.remove();
	},200);
}

function renderExercise(scrName){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$.ajax({
		url:"api/getQuestion.php",
		type:"GET",
		data:{
			subject:scrName
		},
		dataType:'json',
		success:function(data){
			$("#app").empty();
			$("#app").append(`
				<div class='questionDiv'>
					<i class="fa fa-star" aria-hidden="true"></i>
					`+data.question+`

					<div id='msgQuestion' class='mt-3'></div>

					<div class='mt-3' id='nextExerciseDiv'>
						<div class='w-100 text-right mt-2'>
							<a class='btn btn-info text-white' onclick='renderExercise("`+scrName+`")'>
							<i class="fa fa-arrow-right" aria-hidden="true" title='Câu tiếp theo'></i></a>
						</div>
					</div>
				</div>

				
			`);

			$.each($(".questionDiv li"), function(i,v){
				$(v).attr("title", "Chọn đáp án này");
				var isClickTrue = false;
				var border = '#f5c6cb';
				if(data.choose=="A" && i==0 
				  ||data.choose=="B" && i==1
				  ||data.choose=="C" && i==2
				  ||data.choose=="D" && i==3
				){
					isClickTrue = true;
					border = '#c3e6cb';
				}

				$(v).click(function(){
					$(".questionDiv li").css("background", "#fff");
					$(v).css("background", "#fafafa");
					$(v).css("border", "1px solid "+ border);
					answerAction(isClickTrue, data.answer, scrName);
				});
			});
		}
	});
	setTimeout(function(){
		loader.remove();
	}, 300);
}

function answerAction(answer, dataAnswer, scrName){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);

	var className = "alert-danger";
	var msg = "Chưa chính xác";
	if(answer){
		className = "alert-success";
		msg = "Chính xác";
	}
	var divSuccess = $(`
		<div class="alert `+ className +` alert-dismissible">
	  		<strong>`+ msg +`!</strong><br>
	  		<div id='answerDiv' class='mt-2'>
	  			`+dataAnswer+`
	  		</div>
	  		<div class='w-100 text-right'>
				<a class='btn btn-info text-white' onclick='renderExercise("`+scrName+`")'>
				<i class="fa fa-arrow-right" aria-hidden="true" title='Câu tiếp theo'></i></a>
			</div>
		</div>
	`);

	$(".questionDiv #msgQuestion").empty();
	setTimeout(function(){
		loader.remove();
		$(".questionDiv #msgQuestion").html(divSuccess);
	}, 300);

	$(".questionDiv li").off('click');
	$(".questionDiv li").css('cursor', 'context-menu');
	$("#nextExerciseDiv").remove();
	$(".questionDiv li").attr('title','');
}


//renderExamination

function renderExamination(scrName){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	var structures = [
		{
			'chapter' : 1, 
			'type' : 'Theory',
			'amount' : 1
		},
		{
			'chapter' : 2, 
			'type' : 'Theory',
			'amount' : 1
		},
		{
			'chapter' : 3, 
			'type' : 'Theory',
			'amount' : 1
		},
		{
			'chapter' : 3, 
			'type' : 'Exercise',
			'amount' : 1
		}
	];
	var arrayResult = [];
	$.each(structures, function(i, structure){
		$.ajax({
			url:"api/getExamination.php",
			type:"GET",
			async:false,
			data:{
				subject:scrName,
				chapter:structure.chapter,
				type:structure.type,
				amount:structure.amount
			},
			dataType:'json',
			success:function(data){
				$.each(data, function(j, row){
					arrayResult.push(row.question);
				});
			}
		});
	});

	arrayResult = shuffle(arrayResult);
	$("#app").empty();
	$("#app").append(`
		<div class='questionDiv'>
			<div id='examinationDiv'></div>
			<div id='msgQuestion' class='mt-3'></div>
			<div class='mt-3' id='nextExerciseDiv'>
				<div class='w-100 text-right mt-2'>
					<a class='btn btn-info text-white' onclick='getExaminationResult("`+scrName+`")'>
					Nộ bài</a>
				</div>
			</div>
		</div>

		
	`);
	$.each(arrayResult, function(j, question){
		$("#examinationDiv").append("<b>Câu"+(j+1)+". </b>"+question);
	});

	setTimeout(function(){
		loader.remove();
	}, 300);
}

function shuffle(a) {
    var j, x, i;
    for (i = a.length - 1; i > 0; i--) {
        j = Math.floor(Math.random() * (i + 1));
        x = a[i];
        a[i] = a[j];
        a[j] = x;
    }
    return a;
}