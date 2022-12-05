<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_ks.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/loginSubmit.js"></script>



<style>
.align-center2{
	margin:0 auto;
}

.btn-primary{
	background-color:#8541f5;
	border-color:#8541f5;
}
.btn-primary:hover{
	background-color:#3d0991;
	border-color:#3d0991;
}
</style>
<div class="align_center container mt-5" style="margin:0 auto;">
	<div class="text-center mb-3" >
		<img src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="20%" height="20%">
	</div>
	<%-- <img src="${pageContext.request.contextPath}/images/logo.png"> --%>
	<br>
	<form:form class="g-3 needs-validation" id="login_form" action="login.do" modelAttribute="memberVO">
		<div class="form-floating mb-3 col-3 align-center2"> 
			<form:input path="id" class="form-control left-input" placeholder="id" />
			<form:errors path="id" cssClass="error-color" />
			<label for="id">아이디</label> 		
		</div>

		
		<div class="form-floating mb-3 col-3 align-center2">
			<form:password path="passwd" class="form-control"
				placeholder="passwd" />
			<form:errors path="passwd" cssClass="error-color" />
			<label for="passwd">비밀번호</label>
			<div id="message_id"></div>	

			<input type="submit" class="btn btn-primary mt-3 col-6" id="loginSubmit" style="float:left;border-radius:5px 0 0 5px;" value="Login">
			<input type="button" class="btn btn-outline-secondary mt-3 col-6" style="border-radius:0 5px 5px 0;"
				onclick="location.href='registerUser.do'" value="Sign">
				
		</div>
		<br><br>
		<div class="text-center" style="color:gray;">
			&copy 만나서 반갑습니다. <i><b>Coudy</b></i> 입니다.
		</div>
		
	</form:form>
</div>

<script>
//Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
