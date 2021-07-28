<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.innerOuter{ display:flex;}
	.admin-box,
	.office-box {
	  display: flex;
	  align-self: center;
	  flex-direction: column;
	  border: 1px solid black;
	  min-width: 80%;
      color:rgb(34,34,34);
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
      justify-content: space-around;
      border:none;
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
	  height: 100px;
      width:160px;
	  margin: 0 10px;
	}
	.office-imgs img {
    border: 1px solid rgb(221,221,221);
    border-radius: 8px;
    height: 100%;
    width: 100%;
	}
	.line1,	.line2,	.line3,	.line4 {
	  display: flex;
	  justify-content: space-evenly;
	}
	.line1 ul,.line2 ul,.line3 ul {
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
</head>
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
            <form class="insertOffice" action="insertOf.bk" method="post" enctype="multipart/form-data">
                <div class="office-title">
                    <h1>오피스 추가하기</h1>
                </div>
                <hr>
                <div class="office-imgs">
                    <div class="top-img">
                        <div class="img1"><img id="img1"></div>
                    </div>
                    <div class="below-imgs">
                        <div class="img2"><img id="img2"></div>
                        <div class="img2"><img id="img3"></div>
                        <div class="img2"><img id="img4"></div>
                        <div class="img2"><img id="img5"></div>
                    </div>
                </div>
                <div id="file-area">
                	<input type="file" id="file1" name="file" onchange="loadImg(this, 1);" required>
                	<input type="file" id="file2" name="file" onchange="loadImg(this, 2);">
                	<input type="file" id="file3" name="file" onchange="loadImg(this, 3);">
                	<input type="file" id="file4" name="file" onchange="loadImg(this, 4);">
                	<input type="file" id="file5" name="file" onchange="loadImg(this, 5);">
                </div>
                <hr>
                <div class="office-title">
                    <h2>세부내역</h2>
                </div>
                <div class="office-content">
                    <div class="line1">
                    <%-- 지점 어떻게 해? 1.셀렉트 2.그냥 텍스트  --%>
                        <ul>
                            <li>지점</li>
                            <li><input type="text" name="branch" id=""></li>
                        </ul>
                        <ul>
                            <li>오피스타입</li>
                            <li>
                                <select name="typeName" id="">
                                    <option value="프라이빗">프라이빗</option>
                                    <option value="전용데스크">전용데스크</option>
                                    <option value="공용데스크">공용데스크</option>
                                </select>
                            </li>
                        </ul> 
                        <ul>
                            <li>수용인원</li>
                            <li>
                                <select name="person" id="">
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
                        <ul>
                            <li>가격</li>
                            <li><input type="text" name="price"></li>
                        </ul>
                        <ul>
                            <!-- 여기를 어떻게 하지?? -->
                            <li>매니저</li>
                            <li><input type="text" name="manager"></li>
                        </ul>
                    </div>
                    <div class="line3">
                        <ul>
                            <!-- 다음 주소 api 연결 예정 -->
                            <li>주소</li>
                            <li><input type="text" name="address"></li>
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
                    <button type="submit">작성하기</button>
                    <button type="button"><a href="#">목록으로</a></button>
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
	})
	
	function loadImg(inputFile, num){
			 console.log(inputFile.files.length);
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