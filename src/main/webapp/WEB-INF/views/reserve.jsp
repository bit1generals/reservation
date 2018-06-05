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
									<option value="M">MicroPhone</option>
									<option value="W">WhiteBoard</option>
									<option value="N">NoteBook</option>
									<option value="S">Speaker</option>
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

	// get end time event
	startTime.change(function(event) {
		endTime.empty();
		console.log("start change");
		var start = new Date(this.value).getHours();
		console.log("start " + start);
 		var end = findEndTime(start);
		console.log("end " + end);
 		var date = reservedate.val();
		console.log("date " + date);
		for(start += 1; start <= end ;start++){
			console.log("for in start" + start);
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
					collectTime(start, end);
				});
				makeStartTime();
			}
		});

	});

	function collectTime(start, end) {

		for (start; start < end; start++) {
			impossibleTime.push(start);
		}
	};
	function makeStartTime() {
		var date = reservedate.val();
		startTime.append('<option value="-">-</option>');
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
		console.dir(impossibleTime);
		if(impossibleTime[0] == null){
			return 21;
		}
		impossibleTime.push(start);
		impossibleTime.sort();
		console.dir(impossibleTime);
		var idx = impossibleTime.indexOf(start);
		if(impossibleTime[idx] == 20){
			return 21;
		}
		
		return impossibleTime[idx+1];
	};
</script>