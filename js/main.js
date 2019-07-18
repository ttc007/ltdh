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
				    <div class="card-body">
				    	<h3>Luyện tập</h3>
				    </div>
			    </div>
			    <div class="card bg-light text-dark text-center">
				    <div class="card-body">
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
				</div>

				<div class='mt-3'>
					<span></span>
					<div class='row' id='chooseList'>
					</div>
					<div class='w-100 text-right mt-2'>
						<a class='btn btn-info text-white' onclick='renderExercise("`+scrName+`")'>Câu tiếp</a>
					</div>
				</div>
			`);

			$.each($(".questionDiv li"), function(i,v){
				$(v).attr("title", "Chọn đáp án này");
				if(data.choose=="A" && i==0 
				  ||data.choose=="B" && i==1
				  ||data.choose=="C" && i==2
				  ||data.choose=="D" && i==3
				){
					$(v).click(function(){
						answerAction(true, data.answer);
					});
				} else {
					$(v).click(function(){
						answerAction(false, data.answer);
					});
				}
			});
		}
	})
}

function answerAction(answer, dataAnswer){
	if(answer){
		var divSuccess = $(`
			<div class="alert alert-success alert-dismissible">
		  		<button type="button" class="close" data-dismiss="alert">&times;</button>
		  		<strong>Chính xác!</strong>. <a href='#' id='viewAnswer'>Xem lời giải</a><br><br>
		  		<div id='answerDiv'></div>
			</div>
		`);
		$(".questionDiv").append(divSuccess);
		$(divSuccess).find("#viewAnswer").click(function(){
			$("#answerDiv").html(dataAnswer);
		});
	} else {
		var divDanger = $(`
			<div class="alert alert-danger alert-dismissible">
		  		<button type="button" class="close" data-dismiss="alert">&times;</button>
		  		<strong>Chưa chính xác!</strong>. <a href="#" id='viewAnswer'>Xem lời giải</a><br><br>
		  		<div id='answerDiv'></div>
			</div>
		`);
		$(".questionDiv").append(divDanger);
		$(divDanger).find("#viewAnswer").click(function(){
			$("#answerDiv").append(dataAnswer);
		});
	}
}