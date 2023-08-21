<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<%@ include file="components/common_cs_js.jsp"%>
<style type="text/css">
table {
	border: 0;
}

table td {
	padding: 5px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="admin">
		<div class="card text-center mt-3 mx-auto" style="width: 36rem;">
			<div class="card-header custom-bg">
				<h3>Please Review Before Paying</h3>
			</div>
			<div class="card-body text-center">
				<form action="execute_payment" method="post">
					<input type="hidden" name="paymentId" value="${param.paymentId}" />
					<input type="hidden" name="PayerID" value="${param.PayerID}" />
					<div class="table-responsive">
						<div class="text-center">
							<h3>Transaction Details:</h3>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Description:</th>
									<td>${transaction.description}</td>
								</tr>

								<tr>
									<th scope="col">Subtotal:</th>
									<td>${transaction.amount.details.subtotal}USD</td>
								</tr>

								<tr>
									<th>Shipping:</th>
									<td>${transaction.amount.details.shipping}USD</td>
								</tr>
								<tr>
									<th>Tax:</th>
									<td>${transaction.amount.details.tax}USD</td>
								</tr>
								<tr>
									<th>Total:</th>
									<td>${transaction.amount.total}USD</td>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table-responsive">
						<div class="text-center mt-1">
							<h3>Payer Information:</h3>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>First Name:</th>
									<td>${payer.firstName}</td>
								</tr>
								<tr>
									<th>Last Name:</th>
									<td>${payer.lastName}</td>
								</tr>
								<tr>
									<th>Email:</th>
									<td>${payer.email}</td>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table-responsive">
						<div class="text-center mt-1">
							<h3>Shipping Address:</h3>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>Recipient Name:</th>
									<td>${shippingAddress.recipientName}</td>
								</tr>
								<tr>
									<th>Address:</th>
									<td>${shippingAddress.line1}</td>
								</tr>
								<tr>
									<th>City:</th>
									<td>${shippingAddress.city}</td>
								</tr>
								<tr>
									<th>State:</th>
									<td>${shippingAddress.state}</td>
								</tr>
								<tr>
									<th>Country Code:</th>
									<td>${shippingAddress.countryCode}</td>
								</tr>
								<tr>
									<th>Postal Code:</th>
									<td>${shippingAddress.postalCode}</td>
								</tr>
							</thead>
						</table>
					</div>

					<div class="text-center">
						<input type="submit" class="btn custom-bg text-white"
							value="Pay Now" />
					</div>

				</form>
			</div>

		</div>
	</div>

</body>
</html>