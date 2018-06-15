<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<script>

if(${msg ne null}){
	alert("${msg}");
}
</script>
<section class="wrapper style1">
	<div class="inner">
		<div class="index align-left">

			<section>
				<header class="list">
					<h3>Reserve List</h3>
				</header>
				<div class="content">
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th>No</th>
									<th colspan="2">Hall Name</th>
									<th>Id</th>
									<th>Reservedate</th>
									<th>Start Time</th>
									<th>End Time</th>
									<th>Regdate</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${reserveList}" var="reserveVO">
									<tr data-rno="${reserveVO.rno}" class="rowData" data-state="false">
										<td>${reserveVO.rno}</td>
										<td colspan="2">${reserveVO.hallVO.hname}</td>
										<td>${reserveVO.id}</td>
										<td>${reserveVO.reservedate}</td>
										<td><fmt:formatDate value="${reserveVO.startTime}"
												pattern="HH:mm" /></td>
										<td><fmt:formatDate value="${reserveVO.endTime}"
												pattern="HH:mm" /></td>
										<td><fmt:formatDate value="${reserveVO.regdate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="5"><input style="float: right;"></td>
									<td colspan="3"><a href="/reserve/register"
										style="float: right;" class="button">Reservation</a></td>
								</tr>
							</tfoot>
						</table>
						<center>
							<nav>
								<ul class="pagination">

									<c:if test="${pm.prev}">
										<li><a href="/reserve/list?page=${pm.start -1}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>


									<c:forEach begin="${pm.start}" end="${pm.end}" var="num">
										<li class=" ${param.page eq num? 'active' : ''}"><a
											href="/reserve/list?page=${num}">${num}</a></li>
									</c:forEach>


									<c:if test="${pm.next}">
										<li><a href="/reserve/list?page=${pm.end +1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</ul>
							</nav>
						</center>
					</div>


				</div>
			</section>

		</div>
	</div>
</section>
<%@include file="../includes/footer.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<tr class='loadArticle'>
	<td colspan='8'>
		└> 
	{{#if .}}
		{{#each .}}
			{{aname}} : {{this.serials.length}} 개
		{{/each}}
	
	{{else}}
           Articles was not reserved.
	{{/if}}
	</td>
</tr>
<input class='loadArticle' type='hidden'/>



</script>
<script>
	var rowData = $(".rowData");
	var template = Handlebars.compile($("#template").html());
	var statement = "";
	
	rowData.click( function(event){
		var selectedData = $(this);
		var rno = selectedData.data("rno");
		var state = selectedData.data("state");
		console.log(statement);
		console.log($(".loadArticle"));
		$(".loadArticle").remove();
		if(statement != rno){
			console.log("if in! ==" + statement);
			selectAjax(rno, selectedData);
			statement = rno;
		}else{
			statement = "";
		}
		


	});
	function selectAjax(rno, selectedData){
		$.ajax({
			url : '/ajax/reserveArticleData?rno='+rno,
			type : 'get',
			dataType : 'text',
			processData : false,
			contentType : "application/json;charset=UTF-8",
			success : function(articleVOList) {
				var obj = JSON.parse(articleVOList);
				console.dir($(obj));
				var html = template(obj);
				selectedData.after(html);				
			}
		});
	};
		
</script>
