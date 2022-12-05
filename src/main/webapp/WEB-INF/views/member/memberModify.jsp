<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/confirmId.js"></script>


<style>
.input-form{
	margin:0 auto; 
	width:30%;
}

.right-button{
	width:30%;
	height:58px;

}

.left-input{
	width:70%;
	float:left;
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


<h2>회원가입</h2>
<form:form id="register_form" action="updateUser.do" modelAttribute="memberVO">

<div class="text-center">
	<img  class="mb-4 mt-2" src="${pageContext.request.contextPath}/images/COUDY_logo-04.png" width="15%" height="15%">	
</div>

<div class="input-form">

	
 	<div class="form-floating mb-3">
		<form:input path="name" class="form-control" placeholder="name"/>
		<form:errors path="name" cssClass="error-color"/>
		<label for="name">이름</label>
	</div> 
	
	<div class="form-floating mb-3">
		<form:input path="phone" class="form-control" placeholder="phone"/>
		<form:errors path="phone" cssClass="error-color"/>
		<label for="phone">전화번호</label>
	</div> 
	
	<div class="form-floating mb-3">
		<form:input type="email"  path="email" class="form-control" placeholder="name@example.com"/>
		<form:errors path="email" cssClass="error-color"/>
		<label for="email">이메일</label>
	</div>
	
	<div class="form-floating mb-3">
		<form:input path="zipcode" class="form-control left-input" style="border-radius:5px 0 0 5px;" placeholder="zipcode"/>
		<input class="btn btn-secondary right-button" type="button" style="border-radius:0 5px 5px 0;" value="우편번호찾기" onclick="execDaumPostcode()"/>
		<form:errors path="zipcode" cssClass="error-color"/>
		<label for="zipcode">우편번호</label>
	</div>
	
	<div class="form-floating mb-3"> 
		<form:input path="address1" class="form-control" placeholder="address1"/>
		<form:errors path="address1" cssClass="error-color"/>
		<label for="address1">주소</label>
	</div>
	
	<div class="form-floating mb-3">
		<form:input path="address2" class="form-control" placeholder="address2"/>
		<form:errors path="address2" cssClass="error-color"/>
		<label for="address2">상세주소</label>
	</div>
	<div>
	
	</div>
	
	
</div>
<div class="col-12 input-form">
	    <button class="btn btn-primary" id="submit" type="submit" style="width:50%;border-radius:5px 0 0 5px;">수정하기</button>
	    <button class="btn btn-outline-secondary" type="button" style="width:50%;float:right;border-radius:0 5px 5px 0;" onclick="location.href='/member/myPage.do'">뒤로가기</button>
</div>
</form:form>	





<!-- 우편번호 검색 시작 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호 검색 끝 -->
































