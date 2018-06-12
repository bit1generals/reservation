<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./includes/header.jsp"%>


<style>
.secondRow, .thirdRow {
	display: none;
}
</style>
<section class="wrapper style1">
	<div class="inner">
		<div class="index align-left">

			<section>
				<header>
					<h3>Reservation</h3>
				</header>
				<div class="content">

					<form method="post" action="/reserve">

						<div class="field half first firstRow">
							<label for="department">Lecture Room</label>
							<div class="select-wrapper">
								<select name="hno" id="department" data-name="Lecture Room">
									<c:forEach items="${hallList}" var="hallVO">
										<option value="${hallVO.hno}">${hallVO.hname}
											(${hallVO.maximum} person)</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="field half firstRow">
							<label for="department">Date</label>
							<div class="select-wrapper">
								<input type="text" id="reservedate" name="reservedate" data-name="Date"
									autocomplete="off" />
							</div>
						</div>

						<div class="field half first secondRow">
							<label for="department">Start Time</label>
							<div class="select-wrapper">
								<select name="startTime" id="startTime" data-name="Start Time">
								</select>
							</div>
						</div>

						<div class="field half secondRow">
							<label for="department">End Time</label>
							<div class="select-wrapper">
								<select name="endTime" id="endTime" data-name="End Time">
								</select>
							</div>
						</div>

						<div class="field four first thirdRow">
							<label for="department">Article</label>
							<div class="select-wrapper">
								<select name="type" id="type">
									<option value="none">None</option>
									<c:forEach items="${articleList}" var="articleVO">
										<option value="${articleVO.type}"
											data-aname="${articleVO.aname}">${articleVO.aname}</option>
									</c:forEach>
								</select>
							</div>
						</div>


						<div class="field four thirdRow">
							<label for="department">Count</label>
							<div class="select-wrapper">
								<select name="count" id="count">
								</select>
							</div>
						</div>

						<div class="articleArea field four half thirdRow">
							<ul class="articleList"></ul>
						</div>


						<div class="field fourthRow">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6"
								style="resize: none"></textarea>
						</div>

						<ul class="actions fifthRow">
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
</style>
<script>
	var impossibleTime = [];
	var serials = [];
	var reservedate = $("#reservedate");
	var startTime = $("#startTime");
	var endTime = $("#endTime");
	var type = $("#type");
	var count = $("#count");
	var articleList = $(".articleList");
	var firstRow = $(".firstRow");
	var secondRow = $(".secondRow");
	var thirdRow = $(".thirdRow select");
	var serialsMap = new Map();
	
	$('form').submit(function(event){
		var form = $(this);
 		var submitAllow = false;
		
		$(".firstRow, .secondRow")
			.find("input, select")
			.each(function(idx,target){
			 	var inputData = $(target);
				console.log(inputData.data("name") + " in foreach"+inputData.val());
				if (!$(target).val()){
					alert(inputData.data("name")+"을 입력해주세요");
					return submitAllow;
				}
		});
		
		$(".article").each(function(idx,target){
			var type = $(target).data("type");
			var count = $(target).data("count");
			var serials = $(target).data("serials");
			
			form.append("<input type='hidden' name='articleList["+ idx +"].type' value='"+ type +"'/>");
			
			for(var i = 0; i < count; i++){
				console.dir(serialsMap.get(type)[i]);
				form.append("<input type='hidden' name='articleList["+ idx +"].serials["+ i +"]' value='"+ serialsMap.get(type)[i] +"'/>")
			}

		});
		submitAllow = true;
		
		return submitAllow;
	});

	$("#reservedate").datepicker({
		dateFormat : 'yy-mm-dd'
	});

	console.dir($('.firstRow input'));
	firstRow.on("change", "select,input", function(e) {
		console.dir($(this));
	});
	thirdRow.find('option:first').attr('selected', 'selected');

	secondRow.on("change", "select", function(e) {
		$(".thirdRow").show();
		console.dir(thirdRow[0]);
		console.dir(thirdRow[1]);
		thirdRow.find('option').removeAttr('selected');
		thirdRow.find('option:first').attr('selected', 'selected');
		articleList.children().remove();
	});

	$(".articleList").on("click", "span", function(event) {
		console.dir($(this).parent("li").remove());
	});

	count.change(function(event) {
		var value = $(this).val();
		if (value === 0) {
			return;
		}
		serialsMap.set(type.val(), serials.slice());
		console.dir(serialsMap);
		makeArticleList(value);
		
	});

	type.change(function(event) {
		serials = [];
		count.empty();
		var obj = {
			"startTime" : startTime.val(),
			"endTime" : endTime.val(),
			"type" : type.val()
		};

		$.ajax({
			url : '/ajax/articleData',
			type : 'post',
			data : JSON.stringify(obj),
			dataType : 'json',
			processData : false,
			contentType : "application/json;charset=UTF-8",
			success : function(articleVO) {
				serials = articleVO.serials;
				makeCount();
			}
		});
	});

	// get end time event
	startTime.change(function(event) {
		endTime.empty();
		var start = new Date(this.value).getHours();
		var end = findEndTime(start);
		var date = reservedate.val();
		for (start += 1; start <= end; start++) {
			endTime.append('<option value="' + date + ' '
					+ ('00' + start).slice(-2) + ':00:00">' + start
					+ ':00</option>');
		}
		;

	});

	// get date event
	firstRow.change(function(event) {
		init();

		if (reservedate.val() != "") {
			$(".secondRow").show();

			var obj = {
				"hno" : $('select[name="hno"] option:selected').val(),
				"reservedate" : reservedate.val() + " 00"
			};

			$.ajax({
				url : '/ajax/timeData',
				type : 'post',
				data : JSON.stringify(obj),
				dataType : 'json',
				processData : false,
				contentType : "application/json;charset=UTF-8",
				success : function(timeDataList) {
					var targetList = $(timeDataList);
					targetList.each(function(idx, item) {
						var start = new Date(item.startTime).getHours();
						var end = new Date(item.endTime).getHours();
						/* var start = item.starttime;
						var end = item.endtime; */
						console.log(start);
						console.log(end);
						collectTime(start, end);
					});
					makeStartTime();
				}
			});
		}
		;
	});

	function collectTime(start, end) {
		for (start; start < end; start++) {
			impossibleTime.push(start);
		}
	};
	function makeStartTime() {
		var date = reservedate.val();

		startTime.append('<option></option>');

		for (var num = 9; num < 21; num++) {
			startTime.append('<option value="'
					+ date
					+ ' '
					+ ('00' + num).slice(-2)
					+ ':00:00"'
					+ (impossibleTime.includes(num) ? 'disabled="disabled"'
							: '') + '">' + num + ':00</option>');
		}
		;
	};

	function init() {
		impossibleTime = [];
		startTime.empty();
		endTime.empty();
		type.val("none");
		count.empty();
		articleList.empty();
		$(".secondRow").hide();
		$(".thirdRow").hide();
		
	};

	function findEndTime(start) {
		var result = 21;
		if (impossibleTime[0] != null) {
			console.log(impossibleTime);
			impossibleTime.sort(function(a, b) {
				return a - b;
			});
			console.log(impossibleTime);

			impossibleTime.some(function(imptime) {
				if (start < imptime) {
					result = imptime;
					return result;
				}
				;
			});
		}
		;
		return result;
	};

	function makeCount() {
		for (var num = 0; num <= serials.length; num++) {
			count.append("<option value="+num+">" + num + "</option>");
		}
	};

	function makeArticleList(value) {
		var articleName = $('select[name="type"] option:selected')
				.data("aname");

		articleList.children().each(function(idx, target) {
			var existType = $(target).data("type");
			if (type.val() === existType) {
				$(this).remove();
			}
		});
		articleList
				.append("<li class='department article' data-type='" + type.val() + "' data-count='"+ value
						+ "'>" + articleName + " : " + value 
						+ "ea <span>X</span></li>");
	};
</script>