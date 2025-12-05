
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
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

.form-check-input:invalid ~ .invalid-feedback {
	display: block;
}
</style>
</head>

<body class="bg-light">

	<main class="flex-grow-1 d-flex align-items-center py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6">
					<div class="card shadow-sm border-0">
						<div class="card-body p-4">

							<div class="text-center mb-4">
								<i class="fas fa-user-plus text-primary mb-3"
									style="font-size: 3rem;"></i>
								<h2 class="h4 text-dark fw-bold">Create Your Account</h2>
								<p class="text-muted small">Join us</p>
							</div>

							<c:if test="${not empty registerError}">
								<div class="alert alert-danger alert-dismissible fade show"
									role="alert">
									<i class="fas fa-exclamation-triangle me-2"></i> <strong>Error!</strong>
									${registerError}
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
							</c:if>

							<form method="post" action="Register">
								<div class="mb-3">
									<label for="fullName" class="form-label fw-semibold"> <i
										class="fas fa-user text-muted me-1"></i> Full Name
									</label> <input type="text" class="form-control form-control-lg"
										id="fullName" name="fullName"
										placeholder="Enter your full name" required
										autocomplete="name" minlength="2" maxlength="100"
										pattern="^[A-Za-z]{2}([A-Za-z ]|\\[nta])*$"
										title="Full name must be 2-100 characters and contain only letters and spaces"
										value="${param.fullName}">
									<div class="invalid-feedback">Please enter your full name
										(2-100 characters, letters. Can not start with space.)</div>
								</div>

								<div class="mb-3">
									<label for="username" class="form-label fw-semibold"> <i
										class="fas fa-user-tag text-muted me-1"></i> Username
									</label> <input type="text" class="form-control form-control-lg"
										id="username" name="username"
										placeholder="Choose a unique username" required minlength="2"
										maxlength="25" pattern="^[a-zA-Z0-9_]{2,25} ?$"
										title="Username must be 2-25 characters and contain only letters, numbers, and underscores"
										value="${param.username}">
									<div class="invalid-feedback">Please choose a username
										(2-25 characters, letters, numbers, and underscores only).</div>
								</div>

								<div class="mb-3">
									<label for="email" class="form-label fw-semibold"> <i
										class="fas fa-envelope text-muted me-1"></i> Email Address
									</label> <input type="email" class="form-control form-control-lg"
										id="email" name="email" placeholder="Enter your email address"
										required autocomplete="email"
										pattern="[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}"
										onkeypress="return event.charCode !=32"
										maxlength="100" title="Please enter a valid email address"
										value="${param.email}">
									<div class="invalid-feedback">Please enter a valid email
										address.</div>
								</div>

								<div class="mb-3">
									<label for="password" class="form-label fw-semibold"> <i
										class="fas fa-lock text-muted me-1"></i> Password
									</label> <input type="password" class="form-control form-control-lg"
										id="password" name="password"
										placeholder="Create a strong password" required
										autocomplete="new-password" minlength="8" maxlength="18"
										pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9\s])[^\s]{8,}$"
										onkeypress="return event.charCode !=32"
										title="Password must be at least 8 characters and include at least one uppercase letter, one lowercase letter, one number, and one special character">

									<div class="invalid-feedback">Password must be at least 8
										characters with uppercase, lowercase, and a number.</div>
								</div>

								<div class="mb-4">
									<label for="confirmPassword" class="form-label fw-semibold">
										<i class="fas fa-lock text-muted me-1"></i> Confirm Password
									</label> <input type="password" class="form-control form-control-lg"
										id="confirmPassword" name="confirmPassword"
										placeholder="Re-enter your password" required
										autocomplete="new-password" minlength="8" maxlength="18"
										pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9\s])[^\s]{8,}$"
										onkeypress="return event.charCode !=32"
										title="Please confirm your password">
									<div class="invalid-feedback">Please confirm your
										password.</div>
								</div>

								<div class="mb-3">
									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											id="agreeTerms" name="agreeTerms" required
											title="You must agree to the Terms of Service and Privacy Policy">
										<label class="form-check-label text-muted" for="agreeTerms">
											I agree to the <a href="TermsAndPrivacy.html"
											class="text-primary text-decoration-none">Terms of
												Service</a> and <a href="TermsAndPrivacy.html"
											class="text-primary text-decoration-none">Privacy Policy</a>
										</label>
										<div class="invalid-feedback">You must agree to the
											Terms of Service and Privacy Policy.</div>
									</div>
								</div>

								<div class="d-grid mb-3">
									<button type="submit"
										class="btn btn-primary btn-lg fw-semibold">
										<i class="fas fa-user-plus me-2"></i> Create Account
									</button>
								</div>
							</form>

							<hr class="my-4">
							<div class="text-center">
								<p class="text-muted small mb-2">Already have an account?</p>

								<a href="Login"
									class="btn btn-outline-primary btn-sm fw-semibold"> <i
									class="fas fa-sign-in-alt me-1"></i> Login here
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