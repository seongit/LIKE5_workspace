<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.innerOuter{ display:flex;}
	.admin-box,
	.office-box {
	  display: flex;
	  align-self: center;
	  flex-direction: column;
	  border: 1px solid black;
	  min-width: 80%;
	}
	.button-box {
	  float: right;
	}
	table {
	  margin: 32px 0;
	  min-width: 100%;
	}
	.top-img {
	  display: flex;
      justify-content: center;
	}
	.top-img .img1{
	height: 220px;
    width: 400px;
	overflow: hidden;
	}
	.below-imgs {
	  display: flex;
	  justify-content: space-around;
	  margin-top: 20px;
	}
	.img2 {
	  height:100px;
      width:160px;
	  margin: 0 10px;
	  border: 1px solid rgb(221,221,221);
      border-radius: 8px;
	}
	.office-imgs img {
    border: 1px solid rgb(221,221,221);
    border-radius: 8px;
    height: 100%;
    width: 100%;
    object-fit: cover;
    object-position:50% 50%;
	}
	
	.line1,	.line2,	.line3,	.line4 {
	display: flex;
	justify-content: space-evenly;
	}
	.line1 ul,	.line2 ul, .line3 ul {
	list-style-type: none;
	margin: 10px;
	padding: 0;
	width: 100%;
	}
    .office-content option, .office-content select{
        border: 1px solid rgb(221,221,221);
        border-radius: 8px;
        width:100%;
        height: 30px;
    }
	.office-content ul li input {
	width: 100%;
	height: 30px;
    border: 1px solid rgb(221,221,221);
    border-radius: 8px;
	}
	.linecheck1,.linecheck2,.linecheck3 {
	  display: flex;
	  justify-content: space-around;
	  text-align: center;
	  padding: 0;
	  margin: 10px 0;
	}
	.office-content input[type="checkbox"] {
	  margin: 0 5px;
	}
	.button-box{
        margin-right: 10px;
    }
    .button-box button{
        margin:5px;
    }
    .button-box button[type=submit]{
        background-color: #eb3e3e;
        border:none;
        border-radius: 3px;
        color:#ffff;
        height: 40px;
        width: 120px;
    }
    .button-box button[type=button]{
        background-color: #ffff;
        border:1.5px solid #eb3e3e;
        border-radius: 3px;
        height: 40px;
        width: 120px;
        color:#eb3e3e;
    }
</style>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="innerOuter">
        <nav class="nav flex-column">
            <a class="nav-link active" href="#">Active</a>
            <a class="nav-link" href="#">Link</a>
            <a class="nav-link" href="#">Link</a>
            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </nav>
        <div class="office-box">
            <form class="updateOffice" action="updateOf.bk" method="post" enctype="multipart/form-data">
                <div class="office-title">
                    <h1>${ o.typeName } ${ o.person }</h1>
                </div>
                <hr>
                <div class="office-imgs">
                    <div class="top-img">
                        <div class="img1"><img id="img1" name="offImgPath" src="${o.offImgPath}"></div>
                        <input type="hidden" name="offImgPath" value="${ o.offImgPath }">
                    </div>
                    <div class="below-imgs">
                    <c:choose>
                    	<%--리스트에 사진이 없을때 --%>
                    	<c:when test="${ list.isEmpty() }">
                    		<div class="img2"><img id="img2"></div>
                    		<div class="img2"><img id="img3"></div>
                    		<div class="img2"><img id="img4"></div>
                    		<div class="img2"><img id="img5"></div>
                    	</c:when>
                    	
                    	<%--리스트에 사진이 1개일때--%>
                    	<c:when test="${fn:length(list) == 1}">
                    		<c:forEach var="att" items="${ list }" varStatus="status">
                    			<div class="img2"><img id="img${ status.count+1 }" src="${ att.filePath }"></div>
                    			<input type="hidden" name="fileNo" value="${ att.fileNo }">
                    			<input type="hidden" name="filePath" value="${ att.filePath }">
                    		</c:forEach>  
                    		<%--
                    		<div class="img2"><img id="img2" src="${list[0].filePath }"></div>
                    		<input type="hidden" name="fileNo" value="${ list[0].fileNo }">
                    		<input type="hidden" name="filePath" value="${ list[0].filePath }">--%>
                    		
                    	    <div class="img2"><img id="img3"></div>
                    		<div class="img2"><img id="img4"></div>
                    		<div class="img2"><img id="img5"></div>
                    	</c:when>
                    	<c:when test="${ fn:length(list) == 2 }">
                    	<c:forEach var="att" items="${ list }" varStatus="status">
                    		<div class="img2"><img id="img${ status.count+1 }" src="${ att.filePath }"></div>
                    		<input type="hidden" name="fileNo" value="${ att.fileNo }">
                    		<input type="hidden" name="filePath" value="${ att.filePath }">
                    	</c:forEach>
                    	    <div class="img2"><img id="img4"></div>
                    		<div class="img2"><img id="img5"></div>
                    	</c:when>
                    	<c:when test="${ fn:length(list) == 3}">
                    	<c:forEach var="att" items="${ list }">
                    		<div class="img2"><img id="img${ status.count+1 }" src="${ att.filePath }"></div>
                    		<input type="hidden" name="fileNo" value="${ fileNo }">
                    		<input type="hidden" name="filePath" value="${ filePath }">
                    	</c:forEach>
                    		<div class="img2"><img id="img5"></div>
                    	</c:when>
                    	<c:when test="${fn:length(list) == 4}">
                    	<c:forEach var="att" items="${ list }">
                    		<div class="img2"><img id="img${ status.count+1 }" src="${ att.filePath }"></div>
                    		<input type="hidden" name="fileNo" value="${ fileNo }">
                    		<input type="hidden" name="filePath" value="${ filePath }">
                    	</c:forEach>
                    	</c:when>
                    </c:choose>
                    
                    <%-- 
                        <div class="img2"><img src="resources/images/result-2.jpg"></div>
                        <div class="img2"><img src="resources/images/result-3.jpg"></div>
                        <div class="img2"><img src="resources/images/DEDICATED_DESK_01.jpg"></div>
                        <div class="img2"><img src="resources/images/desc-3.jpg" ></div>
                    --%>
                    </div>    
                </div>
               	<div id="file-area">
                	<input type="file" id="file1" name="refile" onchange="loadImg(this, 1);">
                	<input type="file" id="file2" name="refile" onchange="loadImg(this, 2);">
                	<input type="file" id="file3" name="refile" onchange="loadImg(this, 3);">
                	<input type="file" id="file4" name="refile" onchange="loadImg(this, 4);">
                	<input type="file" id="file5" name="refile" onchange="loadImg(this, 5);">
                </div>
                <hr>
                <div class="office-title">
                    <h2>세부내역</h2>
                </div>
                <div class="office-content">
                    <div class="line1">
                        <ul>
                            <li>오피스번호</li>
                            <li><input type="text" name="officeNo" value="${ o.officeNo }"></li>
                        </ul>
                        <ul>
                            <li>오피스타입</li>
                            <li>
                                <select name="typeName" id="typeName">
                                    <option value="프라이빗">프라이빗</option>
                                    <option value="전용 데스크">전용 데스크</option>
                                    <option value="공용 데스크">공용 데스크</option>
                                </select>
                            </li>
                        </ul>
                        <ul>
                            <li>수용인원</li>
                            <li>
                                <select name="person" id="person">
                                    <option value="1">1 인</option>
                                    <option value="2">2 인</option>
                                    <option value="3">3 인</option>
                                    <option value="4">4 인</option>
                                    <option value="5">5 인이상</option>
                                </select>
                            </li>
                        </ul>    
                    </div>
                    <div class="line2">
                    <%-- 지점 어떻게 해? --%>
                        <ul>
                            <li>지점</li>
                            <li><input type="text" name="branch" value="${ o.branch }"></li>
                        </ul>
                        <ul>
                            <li>가격</li>
                            <li><input type="text" name="price" value="${ o.price }"></li>
                        </ul>
                        <ul>
                            <li>매니저</li>
                            <li><input type="text" name="manager" value="${ o.manager }"></li>
                        </ul>
                    </div>
                    <div class="line3">
                        <ul>
                            <li>주소</li>
                            <li><input type="text" name="address" value="${ o.address }"></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="facility-box">
                    <div class="office-title">
                        <h2>시설정보</h2>
                    </div>
                    <div class="office-content">
                        <div class="linecheck1">
                            <label for="">
                                <input type="checkbox" name="facility" value="와이파이">인터넷
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="프린트">프린터
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="팬트리">팬트리
                            </label>
                            
                        </div>
                        <div class="linecheck2">
                            <label for="">
                                <input type="checkbox" name="facility" value="회의실">회의실
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="주차">주차
                            </label>
                            
                            <label for="">
                                <input type="checkbox" name="facility" value="사무기기">사무기기
                            </label>
                            
                        </div>
                        <div class="linecheck2">
                            <label for="">
                                <input type="checkbox" name="facility" value="냉/난방시설">냉난방
                            </label>
                            <label for="">
                                <input type="checkbox" name="facility" value="위생">위생
                            </label>
                            <label for="">
                                <input type="checkbox" name="facility" value="매니저">매니저
                            </label>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="button-box">
                    <button type="submit">수정하기</button>
                    <button type="button">삭제하기</button>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="../common/footer.jsp"/>
<script>
	$(function(){
		$("#file-area").hide();
		
		$("#img1").click(function(){
			$("#file1").click();
		})
		$("#img2").click(function(){
			$("#file2").click();
		})
		$("#img3").click(function(){
			$("#file3").click();
		})
		$("#img4").click(function(){
			$("#file4").click();
		})
		$("#img5").click(function(){
			$("#file5").click();
		})
		
		$("#typeName option").each(function(){
			if($(this).val() == "${o.typeName}"){
				$(this).prop("selected", true);
			}
		})
		
		$("#person option").each(function(){
			if($(this).val() == ${o.person}){
				$(this).prop("selected", true);
			}
		})
		
		var facility = "${ o.facility }";
		var facilityArr = facility.split(",");
		console.log(facility);
		console.log(facilityArr);
		$("input:checkbox").each(function(){
			if(facilityArr.indexOf($(this).val()) != -1){
				$(this).prop("checked", true);
			}
		});
		
	});
	
		function loadImg(inputFile, num){
			 //console.log(inputFile.files.length);
			if(inputFile.files.length == 1){
				
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					switch(num){
					case 1: $("#img1").attr("src", e.target.result); break;
					case 2: $("#img2").attr("src", e.target.result); break;
					case 3: $("#img3").attr("src", e.target.result); break;
					case 4: $("#img4").attr("src", e.target.result); break;
					case 5: $("#img5").attr("src", e.target.result); break;
					}
				}
			} else {
				switch(num){
				case 1: $("#img1").attr("src", null); break;
				case 2: $("#img2").attr("src", null); break;
				case 3: $("#img3").attr("src", null); break;
				case 4: $("#img4").attr("src", null); break;
				case 5: $("#img5").attr("src", null); break;
				}
			}
		}
</script>
</body>
</html>