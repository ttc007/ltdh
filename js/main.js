var structure = [{"chapter":1,"type":"Theory","amount":3},{"chapter":1,"type":"Exercise","amount":4},
{"chapter":2,"type":"Theory","amount":2},{"chapter":2,"type":"Exercise","amount":3},
{"chapter":3,"type":"Theory","amount":1},{"chapter":3,"type":"Exercise","amount":6},
{"chapter":4,"type":"Theory","amount":1},{"chapter":4,"type":"Exercise","amount":2},
{"chapter":5,"type":"Theory","amount":3},{"chapter":5,"type":"Exercise","amount":2},
{"chapter":6,"type":"Theory","amount":1},{"chapter":6,"type":"Theory","amount":3},
{"chapter":7,"type":"Exercise","amount":2},{"chapter":7,"type":"Theory","amount":3},
{"chapter":8,"type":"Exercise","amount":1},{"chapter":9,"type":"Exercise","amount":1},{"chapter":10,"type":"Exercise","amount":1}]

console.log(JSON.stringify(structure));

function renderScreen(scrName, scrTitle){
	var loader = $("<div class='overlay'><div class='loader'></div></div>");
	$("body").append(loader);
	$("#screenTitle").html(scrTitle);
	$("#app").empty();
	if(scrName=='home'){
		$("#app").append(`
			<div class='card-columns' style="column-count:2">
				<div class="card bg-light text-dark text-center" onclick="renderScreen('Chemistry', 'Môn Hóa')">
				    <div class="card-body">
				    	<h3>Môn Hóa</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center" onclick="renderScreen('Math', 'Môn Toán')">
				    <div class="card-body">
				    	<h3>Môn Toán</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center" onclick="renderScreen('Physics', 'Môn Lý')">
				    <div class="card-body">
				    	<h3>Môn Lý</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center" onclick="renderScreen('bot', 'Bot')">
				    <div class="card-body">
				    	<h3>Bot</h3>
				    </div>
			    </div>
			</div>
		`);
	} else if(scrName=='bot'){
		$("#app").append(`Chúng tôi đang phát triển 1 con bot siêu thông minh có thể giải mọi bài toán cấp 3.`);
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
				
				var liWidth = parseFloat($(v).css('width'));
				var ulWidth = parseFloat($(v).closest( "ul" ).css('width'));
				if(liWidth>ulWidth/2){
					$(v).css('width', '98%');
				} else if(liWidth>ulWidth/4){
					$(v).css('width', '48%');
				}


				var isClickTrue = false;
				var border = '#f5c6cb';
				if(data.choose==i){
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
		<div>
			<div class="alert `+ className +` alert-dismissible">
		  		<strong>`+ msg +`!</strong><br>
			</div>
			<div id='answerDiv'>
				<div class='mt-2'>
					<b>Đáp án:</b>
		  			`+dataAnswer+`
		  		</div>
		  		<div class='w-100 text-right'>
					<a class='btn btn-info text-white' onclick='renderExercise("`+scrName+`")'>
					<i class="fa fa-arrow-right" aria-hidden="true" title='Câu tiếp theo'></i></a>
				</div>
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
	var structures;
	$.ajax({
		url:"api/getStructure.php",
		type:"GET",
		async:false,
		data:{
			subject:scrName,
		},
		dataType:'json',
		success:function(data){
			structures = JSON.parse(data);
		}
	})
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
					arrayResult.push(row.id+"|"+row.question);
				});
			}
		});
	});

	arrayResult = shuffle(arrayResult);
	$("#app").empty();
	$("#app").append(`
		<div class='questionDiv'>
			<div class='w-100 text-center my-5'>
				<h4>Đề ngẫu nhiên</h4>
			</div>
			<div id='examinationDiv'></div>
			<div id='msgResult' class='mt-5'></div>
			<div class='mt-3' id='nextExerciseDiv'>
				<div class='w-100 text-right mt-2'>
					<a class='btn btn-info text-white' onclick='getExaminationResult("`+scrName+`")'>
					Nộp bài</a>
				</div>
			</div>
		</div>

		
	`);
	$.each(arrayResult, function(j, question){
		var id = question.split("|")[0];
		var divQuestion = $("<div class='question' id='question"+j+"'><b>Câu"+(j+1)+". </b>"
			+question.split("|")[1]+"</div>");
		$("#examinationDiv").append(divQuestion);


		$.each($("#question"+j+" li"), function(k, v){
			var liWidth = parseFloat($(v).css('width'));
			var ulWidth = parseFloat($(v).closest( "ul" ).css('width'));
			if(liWidth>ulWidth/2){
				$(v).css('width', '98%');
			} else if(liWidth>ulWidth/4){
				$(v).css('width', '48%');
			}
			$(v).attr("id", id);
			$(v).attr("choose", k);
			$(v).attr("parent", "question"+j);
			$(v).click(function(){
				$("#question"+j+" li").removeClass('questionChoose');
				$(v).addClass("questionChoose");
			});
		});
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

function getExaminationResult(scrName){
	var count = 0;
	var sum = $(".questionChoose").length;
	$.each($(".questionChoose"), function(i,v){
		$.ajax({
			url:"api/getQuestion.php",
			type:"GET",
			data:{
				id:$(v).attr("id")
			},
			async:false,
			dataType:'json',
			success:function(data){
				var choose = $(v).attr("choose");
				var result = false;
				console.log(data.choose);
				if(data.choose==choose){
					result = true;
					count++;
					$(v).css("border-color", "#28a745");
				} else {
					var divQuestion = $(v).attr('parent');
					$("#"+divQuestion +" [choose="+data.choose+"]").css("border-color", "#28a74554");
					$(v).css("border-color", "red");
				}
			}
		});
	});
	var point = (count/sum)*10;
	point = Math.round(point * 100) / 100;
	$("#msgResult").append("Kết quả: "+count+"/"+sum+"<br>Điểm: <span style='color:red'>"+point+"</span>");
	$("#msgResult").css("display", "block");
	$("#nextExerciseDiv").empty();
	$("#nextExerciseDiv").append(`
		<div class='w-100 text-right mt-2'>
			<a class='btn btn-info text-white' onclick="renderScreen('home', 'Home Page')">
			Quay về</a>
		</div>
	`);

}