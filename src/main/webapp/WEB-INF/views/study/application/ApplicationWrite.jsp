<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <main>
          <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" alt="" width="200" height="57">
            <h2>스터디 그룹 신청하기</h2>
            <p class="lead">${studygroup.name}</p>
          </div>
      
          <div class="row g-5">
            <div class="col-md-7 col-lg-12">
              <h4 class="mb-3">${studygroup.description}</h4>
              <form class="row g-3 needs-validation" method="post" action="applicationcreate.do">
                <input type="hidden" id="study_num" name="study_num" value="${studygroup.study_num}">
                <input type="hidden" id="registered" name="registered" value="N">
                <input type="hidden" id="is_group_manager" name="is_group_manager" value="N">
                <div class="mb-3 col-lg-12">
                    <label for="career" class="form-label">경력</label>
                    <input type="text" class="form-control" id="career" name="career" aria-describedby="aboutName" required>
                    <div class="invalid-feedback">
                        경력을 입력하세요.(신입/경력)
                    </div>
                </div>
                <div class="mb-3">
                    <label for="meet_time" class="form-label">가능한 시간</label>
                    <input type="text" class="form-control" id="meet_time" name="meet_time" required>
                    <div class="invalid-feedback">
                        스터디가 가능한 시간을 입력하세요.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="request" class="form-label">스터디 참여시 요구사항</label>
                    <input type="text" class="form-control" id="request" name="request" required>
                    <div class="invalid-feedback">
                        스터디를 설명해 주세요.
                    </div>
                </div>


                <input type="submit" class="btn btn-primary" value="신청하기"></input>
                <input type="button" class="btn btn-danger" onclick="history.back()" value="취소하기"></input>
            </form>
            </div>
          </div>
        </main>
</body>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
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
</html>



