<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<title>Forgot Password</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

input:invalid:not(:placeholder-shown) {
	border-color: #dc3545;
}

input:valid:not(:placeholder-shown) {
	border-color: #198754;
}

input:invalid:not(:placeholder-shown) ~ .invalid-feedback {
	display: block;
}

.card {
	border-radius: 1rem;
	overflow: hidden;
}
</style>
</head>

<body class="bg-light d-flex flex-column min-vh-100">

	<main class="flex-grow-1 d-flex align-items-center py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">

					<div class="card shadow-lg border-0">
						<div class="card-body p-4 p-md-5">


							<div class="text-center mb-4">
								<c:choose>
									<c:when test="${linkSent}">

										<i class="fas fa-paper-plane text-success mb-3"
											style="font-size: 3rem;"></i>
										<h2 class="h4 text-dark fw-bold">Password Reset Link Sent</h2>
										<p class="text-muted small">A password reset link has been
											sent to the email address you provided. Please check your
											inbox (and spam folder) to proceed.</p>
									</c:when>
									<c:otherwise>

										<i class="fas fa-key text-primary mb-3"
											style="font-size: 3rem;"></i>
										<h2 class="h4 text-dark fw-bold">Forgot Password?</h2>
										<p class="text-muted small">Enter your email to receive a
											password reset link.</p>
									</c:otherwise>
								</c:choose>
							</div>


							<c:if test="${not empty successMessage}">
								<div class="alert alert-success alert-dismissible fade show"
									role="alert">
									<i class="fas fa-check-circle me-2"></i> ${successMessage}
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
							</c:if>


							<c:if test="${not empty errorMessage}">
								<div class="alert alert-danger alert-dismissible fade show"
									role="alert">
									<i class="fas fa-exclamation-triangle me-2"></i>
									${errorMessage}
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
							</c:if>

							<form method="post" action="ForgetPassword">


								<div class="mb-4">
									<label for="email" class="form-label fw-semibold"> <i
										class="fas fa-envelope text-muted me-1"></i> Email Address
									</label> <input type="email" class="form-control form-control-lg"
										id="email" name="email"
										placeholder="Enter your registered email" required
										value="${param.email != null ? param.email : email}"
										${linkSent ? 'readonly' : ''}>

									<c:if test="${!linkSent}">
										<div class="invalid-feedback">Please enter a valid email
											address.</div>
									</c:if>
								</div>


								<c:if test="${!linkSent}">
									<div class="d-grid mb-3">
										<button type="submit"
											class="btn btn-primary btn-lg fw-semibold">
											<i class="fas fa-link me-2"></i> Send Password Reset Link
										</button>
									</div>
								</c:if>

							</form>

							<hr class="my-4">


							<div class="text-center">
								<p class="text-muted small mb-2">Remembered your password?</p>
								<a href="Login"
									class="btn btn-outline-primary btn-sm fw-semibold"> <i
									class="fas fa-sign-in-alt me-1"></i> Back to Login
								</a>
							</div>


							<div class="text-center mt-3">
								<p class="text-muted small mb-0">Don't have an account?</p>
								<a href="Register" class="text-decoration-none small">
									Register here </a>
							</div>
						</div>
					</div>


					<div class="text-center mt-4">
						<p class="small text-muted">
							<i class="fas fa-shield-alt text-success me-1"></i> Your
							information is secure and protected
						</p>
					</div>
				</div>
			</div>
		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>