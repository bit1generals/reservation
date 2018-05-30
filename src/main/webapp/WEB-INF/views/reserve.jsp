<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp"%>

<section class="wrapper style1">
	<div class="inner">
		<div class="index align-left">

			<section>
				<header>
					<h3>Reservation</h3>
				</header>
				<div class="content">

					<form method="post" action="#">
						
						<div class="field half first">
							<label for="department">Lecture Room</label>
							<div class="select-wrapper">
								<select name="department" id="department">
									<option value="">- Category -</option>
									<option value="1">Manufacturing</option>
									<option value="2">Shipping</option>
									<option value="3">Administration</option>
									<option value="4">Human Resources</option>
								</select>
							</div>
						</div>
						
						<div class="field half">
							<label for="department">Date</label>
							<div class="select-wrapper">
								<select name="department" id="department">
									<option value="">- Category -</option>
									<option value="1">Manufacturing</option>
									<option value="2">Shipping</option>
									<option value="3">Administration</option>
									<option value="4">Human Resources</option>
								</select>
							</div>
						</div>
						<div class="field third first">
							<input type="radio" id="priority-low" name="priority" checked="">
							<label for="priority-low">Low Priority</label>
						</div>
						<div class="field third">
							<input type="radio" id="priority-normal" name="priority">
							<label for="priority-normal">Normal Priority</label>
						</div>
						<div class="field third">
							<input type="radio" id="priority-high" name="priority"> <label
								for="priority-high">High Priority</label>
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6"></textarea>
						</div>
						<div class="field half first">
							<input type="checkbox" id="copy" name="copy"> <label
								for="copy">Email me a copy of this message</label>
						</div>
						<div class="field half">
							<input type="checkbox" id="human" name="human" checked="">
							<label for="human">I am a human and not a robot</label>
						</div>
						<ul class="actions">
							<li><input type="submit" name="submit" id="submit"
								value="Send Message"></li>
						</ul>
					</form>
				</div>
		</div>
</section>
</div>
</section>
<%@include file="./includes/footer.jsp"%>