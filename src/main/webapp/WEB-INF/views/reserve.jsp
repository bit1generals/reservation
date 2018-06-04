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
								<input type="date" name="reservedate" onchange="handler(event);" />
							</div>
						</div>

						<div class="field half first">
							<label for="department">Start Time</label>
							<div class="select-wrapper">
								<select name="startTime" id="department">
									<option value="2018-06-01 00:00:00">-</option>
									<option value="2018-06-01 09:00:00">9:00</option>
									<option value="2018-06-01 10:00:00">10:00</option>
									<option value="2018-06-01 11:00:00">11:00</option>
									<option value="2018-06-01 12:00:00">12:00</option>
								</select>
							</div>
						</div>

						<div class="field half">
							<label for="department">End Time</label>
							<div class="select-wrapper">
								<select name="endTime" id="department">
									<option value="2018-06-01 00:00:00">-</option>
									<option value="2018-06-01 09:00:00">9:00</option>
									<option value="2018-06-01 02:00:00">10:00</option>
									<option value="2018-06-01 11:00:00">11:00</option>
									<option value="2018-06-01 12:00:00">12:00</option>
								</select>
							</div>
						</div>

						<div class="field four first">
							<label for="department">Article</label>
							<div class="select-wrapper">
								<select name="list[0].type" id="department">
									<option value="">-</option>
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
								<select name="list[0].count" id="department">
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

var startTimeList = [];
	function handler(event) {

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
				console.log("Hall and Date Select");
				console.dir(timeDataList);
				var targetList = $(timeDataList);
				targetList.each(function(index, item) {
					var start = new Date(item.starttime).getHours();
					var end = new Date(item.endtime).getHours();
					startTimeList.push(start);
				});
				console.dir(startTimeList);

				
			}
		});
	};
</script>