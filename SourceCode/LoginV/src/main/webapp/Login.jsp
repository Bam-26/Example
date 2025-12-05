
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">
<title>Document</title>
<style>
input:invalid:not(:placeholder-shown) {
	border-color: #dc3545;
}

input:valid:not(:placeholder-shown) {
	border-color: #198754;
}

input:invalid:not(:placeholder-shown) ~ .invalid-feedback {
	display: block;
}
</style>
</head>

<body class="bg-light">

	<main class="flex-grow-1 d-flex align-items-center py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">

					<div class="card shadow-sm border-0">
						<div class="card-body p-4">

							<div class="text-center mb-4">
								<i class="fas fa-user-circle text-primary mb-3"
									style="font-size: 3rem;"></i>
								<h2 class="h4 text-dark fw-bold">Welcome Back</h2>
								<p class="text-muted small">Sign in to your account</p>
							</div>
							
							<c:if test="${not empty loginError}">
								<div class="alert alert-danger text-center">${loginError}</div>
							</c:if>

						<form method="post" action="Login">
								<div class="mb-3">
									<label for="username" class="form-label fw-semibold"> <i
										class="fas fa-user text-muted me-1"></i> Username
									</label> <input type="text" class="form-control form-control-lg"
										id="username" name="username"
										placeholder="Enter your username" required
										autocomplete="username" minlength="2" maxlength="25"
										pattern="^[a-zA-Z0-9_]{2,25}$"
										onkeypress="return event.charCode !=32"
										title="Username must be 2-25 characters and contain only letters, numbers, and underscores">
									<div class="invalid-feedback">Please enter a valid
										username (2-25 characters, letters, numbers, and underscores
										only).</div>
								</div>

								<div class="mb-4">
									<label for="password" class="form-label fw-semibold"> <i
										class="fas fa-lock text-muted me-1"></i> Password
									</label> <input type="password" class="form-control form-control-lg"
										id="password" name="password"
										placeholder="Enter your password" required	
										onkeypress="return event.charCode !=32"
										autocomplete="current-password" minlength="8" maxlength="12">
									<div class="invalid-feedback">Please enter your password
										(at least 8 characters).</div>
								</div>

								<div class="mb-3">
									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											id="rememberMe" name="rememberMe"> <label
											class="form-check-label text-muted" for="rememberMe">
											Remember me on this device </label>
									</div>
								</div>

								<div class="d-grid mb-3">
									<button type="submit"
										class="btn btn-primary btn-lg fw-semibold">
										<i class="fas fa-sign-in-alt me-2"></i> Login
									</button>
								</div>

								<div class="text-center mb-3">
									<a href="ForgetPassword.jsp"
										class="text-decoration-none small text-muted"> Forgot your
										password? </a>
								</div>
							</form>

							<hr class="my-4">
							<div class="text-center">
								<p class="text-muted small mb-2">Don't have an account?</p>

								<a href="Register"
									class="btn btn-outline-primary btn-sm fw-semibold"> <i
									class="fas fa-user-plus me-1"></i> Register here
								</a>
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