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
								<input type="date"/>
							</div>
						</div>
						
						<div class="field half first">
							<label for="department">Start Time</label>
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
							<label for="department">End Time</label>
							<div class="select-wrapper">
								<select name="department" id="department">
									<option value="">-</option>
									<option value="1">Manufacturing</option>
									<option value="2">Shipping</option>
									<option value="3">Administration</option>
									<option value="4">Human Resources</option>
								</select>
							</div>
						</div>

						<div class="field four first">
							<label for="department">Article</label>
							<div class="select-wrapper">
								<select name="department" id="department">
									<option value="">-</option>
									<option value="1">Manufacturing</option>
									<option value="2">Shipping</option>
									<option value="3">Administration</option>
									<option value="4">Human Resources</option>
								</select>
							</div>
						</div>
						<div class="field four">
							<label for="department">Count</label>
							<div class="select-wrapper">
								<select name="department" id="department">
									<option value="">-</option>
									<option value="1">Manufacturing</option>
									<option value="2">Shipping</option>
									<option value="3">Administration</option>
									<option value="4">Human Resources</option>
								</select>
							</div>
						</div>

						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="6" style="resize: none"></textarea>
						</div>

						<ul class="actions">
							<li><input type="submit" name="submit" id="submit"
								value="Reservation"></li>
							<li><input type="reset" name="reset" id="reset"
								value="Reset"></li>
							<li><input type="button" name="cancel" id="cancel"
								value="Cancel"></li>
						</ul>
					</form>
				</div>
		</div>
</section>
</div>
</section>
<%@include file="./includes/footer.jsp"%>