<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">

							<div class="col">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<c:if test="${not empty message}">
										<div class="alert alert-${alert} text-center">
											${message}</div>
									</c:if>
									<form class="user" action="<c:url value='/dang-nhap'/>"
										method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user"
												name="username" id="exampleInputEmail"
												aria-describedby="emailHelp" placeholder="Enter Usename...">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												name="password" id="exampleInputPassword"
												placeholder="Enter Password...">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div>
										<input type="hidden" value="login" name="action" />
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Login</button>
										<hr>


									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="forgot-password.html">Forgot
											Password?</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.html">Create an Account!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

</body>
</html>