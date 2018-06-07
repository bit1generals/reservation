<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./includes/header.jsp"%>

<section class="wrapper style1">
	<div class="inner">
		<div class="index align-left">

			<section>
				<header>
					<h3>Reservation</h3>
				</header>
				<div class="content">

					<form method="post" action="/reserve">

						<div class="field half first">
							<label for="department">Lecture Room</label>
							<div class="select-wrapper">
								<select name="hno" id="department">
									<c:forEach items="${hallList}" var="hallVO">
										<option value="${hallVO.hno}">${hallVO.hname}
											(${hallVO.maximum}명 수용)</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="field half">
							<label for="department">Date</label>
							<div class="select-wrapper">
								<input type="date" id="reservedate" name="reservedate" />
							</div>
						</div>

						<div class="field half first">
							<label for="department">Start Time</label>
							<div class="select-wrapper">
								<select name="startTime" id="startTime">
								</select>
							</div>
						</div>

						<div class="field half">
							<label for="department">End Time</label>
							<div class="select-wrapper">
								<select name="endTime" id="endTime">
									<option value="2018-06-01 00:00:00">-</option>

								</select>
							</div>
						</div>

						<div class="field four first">
							<label for="department">Article</label>
							<div class="select-wrapper">
								<select name="list[0].type" id="type">
									<option value="">None</option>
									<c:forEach items="${articleList}" var="articleVO">
										<option value="${articleVO.type}">${articleVO.aname}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						<div class="field four">
							<label for="department">Count</label>
							<div class="select-wrapper">
								<select name="list[0].count" id="count">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
						</div>


						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6"
								style="resize: none"></textarea>
						</div>

						<ul class="actions">
							<li><input type="submit" id="submit" value="Reservation"></li>
							<li><input type="reset" id="reset" value="Reset"></li>
							<li><input type="button" id="cancel" value="Cancel"></li>
						</ul>
					</form>
				</div>
		</div>
</section>
</div>
</section>
<%@include file="./includes/footer.jsp"%>
<script>
	var impossibleTime = [];
	var reservedate = $("#reservedate");
	var startTime = $("#startTime");
	var endTime = $("#endTime");
	var type = $("#type");
	
	type.change(function(event) {
		
		console.log("start and end");
		console.log(startTime.val());
		var obj = {
			"starttime" : startTime.val(),
			"endtime" : endTime.val(),
			"type" : type.val()
		};
		
		console.dir(obj);
		
	 	$.ajax({
			url : '/reserve/articleData',
			type : 'post',
			data : JSON.stringify(obj),
			dataType : 'json',
			processData : false,
			contentType : "application/json;charset=UTF-8",
			success : function(articleVO) {
				console.dir(articleVO);
			} 
		});
	});
	
	
	// get end time event
	startTime.change(function(event) {
		endTime.empty();
		var start = new Date(this.value).getHours();
 		var end = findEndTime(start);
 		var date = reservedate.val();
		for(start += 1; start <= end ;start++){
			endTime.append('<option value="' + date + ' ' + ('00' + start).slice(-2) + ':00:00">' + start
					+ ':00</option>');
		};

	});
	
	// get date event
	reservedate.change(function handler(event) {
		init();
		
		var obj = {
			"hno" : $('select[name="hno"] option:selected').val(),
			"reservedate" : event.target.value + " 00"
		};

		$.ajax({
			url : '/reserve/timeData',
			type : 'post',
			data : JSON.stringify(obj),
			dataType : 'json',
			processData : false,
			contentType : "application/json;charset=UTF-8",
			success : function(timeDataList) {
				var targetList = $(timeDataList);
				targetList.each(function(index, item) {
					var start = new Date(item.starttime).getHours();
					var end = new Date(item.endtime).getHours();
					/* var start = item.starttime;
					var end = item.endtime; */
					console.log(start);
					console.log(end);
					collectTime(start, end);
				});
				makeStartTime();
			}
		});

	});

	function collectTime(start, end) {
		console.log("222222222222222222222");
		
		for (start; start < end; start++) {
			impossibleTime.push(start);
		}
		console.dir(impossibleTime);
	};
	function makeStartTime() {
		var date = reservedate.val();
		startTime.append('<option value="-">-</option>');
		console.log("111111111111111111111");
		console.dir(impossibleTime);
		for (var num = 9; num < 21; num++) {
			startTime.append('<option value="' + date + ' ' + ('00' + num).slice(-2) + ':00:00"'
					+ (impossibleTime.includes(num) ? 'disabled="disabled"' : '') + '">' + num
					+ ':00</option>');
		};
	};
	
	function init() {
		impossibleTime = [];
		startTime.empty();
		endTime.empty();
	};
	
	
	
	function findEndTime(start) {
		var result = 21;
		if (impossibleTime[0] != null) {
			impossibleTime.sort((a, b) => a - b);
			impossibleTime.some (imptime => {
				if(start < imptime){
					result = imptime;
					return result;					
				};
			});
		};
		return result;
		};
		
		/* if(impossibleTime[0] == null){
			return 21;
		}
		
		impossibleTime.push(start);
		impossibleTime.sort((a, b) => a - b);

		var idx = impossibleTime.indexOf(start);
		
		if(impossibleTime[idx] == 20){
			return 21;
		}
		
		var result = impossibleTime[idx+1];
		impossibleTime.splice(idx,1);
		return result;
	}; */
</script>