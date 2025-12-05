<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Reset Password</title>
</head>

<body class="bg-light">

    <main class="d-flex align-items-center min-vh-100 py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">

                    <div class="card shadow-sm border-0">
                        <div class="card-body p-4">


                            <div class="text-center mb-4">
                                <i class="fas fa-lock-open text-primary mb-3" style="font-size: 3rem;"></i>
                                <h2 class="h4 text-dark fw-bold">Set New Password</h2>
                                <p class="text-muted small">Create a new strong password</p>
                            </div>


                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <i class="fas fa-check-circle me-2"></i>
                                    ${successMessage}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>


                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    <i class="fas fa-exclamation-triangle me-2"></i>
                                    ${errorMessage}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>


                            <form method="post" action="ResetPassword">
                                

                                <input type="hidden" name="token" value="${param.token}">


                                <div class="mb-3">
                                    <label for="newPassword" class="form-label fw-semibold">
                                        New Password
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white text-muted">
                                            <i class="fas fa-lock"></i>
                                        </span>
                                        <input type="password" class="form-control form-control-lg" 
                                               id="newPassword" name="newPassword"
                                               placeholder="Enter new password" required
                                               minlength="8" maxlength="18"
                                               pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9\s])[^\s]{8,}$"
                                               onkeypress="return event.charCode !=32"
                                               title="Password must be at least 8 characters and include uppercase, lowercase, number, and special character">
                                    </div>
                                    <small class="text-muted">
                                        Must contain: uppercase, lowercase, number, and special character
                                    </small>
                                </div>


                                <div class="mb-4">
                                    <label for="confirmPassword" class="form-label fw-semibold">
                                        Confirm Password
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white text-muted">
                                            <i class="fas fa-check-circle"></i>
                                        </span>
                                        <input type="password" class="form-control form-control-lg" 
                                               id="confirmPassword" name="confirmPassword"
                                               placeholder="Re-enter password" required
                                               minlength="8" maxlength="18"
                                               pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9\s])[^\s]{8,}$"
                                               onkeypress="return event.charCode !=32"
                                               title="Password must not contain spaces">
                                    </div>
                                </div>


                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-primary btn-lg fw-semibold">
                                        Update Password
                                    </button>
                                </div>
                            </form>

                            <hr class="my-4">
                            

                            <div class="text-center">
                                <a href="Login" class="btn btn-outline-primary btn-sm fw-semibold text-decoration-none">
                                    <i class="fas fa-sign-in-alt me-1"></i>
                                    Back to Login
                                </a>
                            </div>

                        </div>
                    </div>


                    <div class="text-center mt-4">
                        <p class="small text-muted">
                            <i class="fas fa-shield-alt text-success me-1"></i>
                            Secure password reset
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>