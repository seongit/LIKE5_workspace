<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 리스트 상세페이지</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	/*여기부터 메인 css*/

     /*전체 공간*/
    .reservationDetail{
        width:1200px !important;
        height:2000px !important;
        margin:auto !important;
        padding:0px 70px 0px 70px;
    }
    /*메인 이미지*/
    .reserveImg{
        width:900px;
        margin-top:-10px;
    }

    /*시설 안내*/
    .facility{
        margin-left:8px;
        border:1px solid lightgray;
        width:600px;
        height:250px;
        padding:20px;
    }
    .fa1{margin-top:-825px;}
    
    /*인터넷/wifi*/
    .wifi{margin-left:30px;}
    .wifi2{margin-left:23px;}

    /*프린트*/
    .print{margin-left:170px; margin-top:-92px;}
    .print2{margin-left:172px;}

    /*주차*/
    .car{margin-left:310px; margin-top:-100px;}
    .car2{margin-left:325px; margin-top:12px;}

    /*컴퓨터/pc*/
    .com{margin-left:450px; margin-top:-95px;}
    .com2{margin-left:445px; margin-top:13px;}

    /*bar*/
    .bar{padding:5px; margin-left:20px;}
    .bar2{margin-left:43px;}

    /*회의실*/
    .meeting{margin-left:170px; margin-top:-90px;}
    .meeting2{margin-left:170px; margin-top:10px;}

    /*냉/난방시설*/
    .wind{margin-left:310px; margin-top:-90px;}
    .wind2{margin-left:300px; margin-top:9px;}

    /*매니저*/
    .people{margin-left:450px; margin-top:-90px;}
    .people2{margin-left:459px; margin-top:2px;}

    /* 세부 공간 선택*/
    .space{margin-left:650px; margin-top:30px;}
    .space2{
        border:1px solid gray;
        width:400px;
        height:750px;
        margin-left:650px;
        background-color: lightgray;
    }
    .space3{
        border:1px solid gray;
        width:350px;
        height:500px;
        margin-left:22px;
        margin-top:30px;
        padding:15px;
        background-color: white;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>    

	<br><br>
	<!--예약 상세페이지-->
    <div class="reservationDetail">

        <!--공간 제목,별점-->
        <div class="wrap1">
            <h1><b>공간 A</b></h1>
            <h4>★ 3.5</h4>
            <h4>후기(10)</h4>
        </div>

        <br>

        <!--메인 사진-->
        
        <div class="reserveImg">
        <div id="demo" class="carousel slide" data-ride="carousel">

			  <!-- Indicators -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			  </ul>
			
			  <!-- 슬라이드 부분 -->
			  <div class="carousel-inner">
			  
			    <div class="carousel-item active">
			    	<img src="${at.get(0).filePath}">
			    </div>
			    <c:forEach var="i" begin="1" end="${ fn:length(at)-1 }">
				    <div class="carousel-item">
				      <img src="${at.get(i).filePath}">
				    </div>
				</c:forEach>
				
				
			  </div>
			
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			
			</div>
        </div>
         

        <br><br>
        
        <!-- 세부 공간 선택-->
        <div class="space"><h3><b>세부 공간 선택</b></h3></div> <br>
        <div class="space2">
            <div class="space3">
                <b>호스트의 승인을 기다릴 필요 없이 <br>
                    지금 바로 예약하세요!</b><br><br>
                <b>공간 A</b> &nbsp;&nbsp;&nbsp;<b>￦50,000 / 1일 </b></b> <br><br><br>
                <b>체크인</b> <br>
                <input type="text" placeholder="2021년 07월 12일(목)"> <br><br>
                <b>체크아웃</b> <br>
                <input type="text" placeholder="2021년 07월 13일(금)"> <br><br><br><br>
                <button type="button" class="btn btn-danger btn-block">예약 하기</button>
            </div>
        </div>

        <!--시설 안내-->
        <div class="fa1"><h3><b>시설 안내</b></h3></div> <br>
        <div class="facility">
            <div class="wifi"><i class='fas fa-wifi' style='font-size:48px;color:red'></i></div> <br>
            <div class="wifi2"><b>인터넷/wifi</b></div>

            <div class="print"><i class='fas fa-print' style='font-size:48px'></i></div> <br>
            <div class="print2"><b>프린트</b></div>
        
            <div class="car"><i class="material-icons" style="font-size:60px">directions_car</i></div>  
            <div class="car2"><b>주차</b></div>
            
            <div class="com"><i class="material-icons" style="font-size:55px">computer</i></div>
            <div class="com2"><b>PC/노트북</b></div> <br>

            <div class="bar"><i class="material-icons" style="font-size:60px">local_bar</i></div>
            <div class="bar2"><b>bar</b></div>

            <div class="meeting"><i class="fa fa-microphone" style="font-size:60px"></i></div>
            <div class="meeting2"><b>회의실</b></div>

            <div class="wind"><i class='fas fa-wind' style='font-size:60px'></i></div>
            <div class="wind2"><b>냉/난방시설</b></div>

            <div class="people"><i class="material-icons" style="font-size:60px">face</i></div>
            <div class="people2"><b>매니저</b></div>

        </div>   

        <br><br> 
        <!--위치(지도)-->
       <div><h3><b>위치</b></h3> <br> 
        <div><img src="../../../resources/images/지도.PNG"></div> <br><br></div>
        
    	<br><br><br><br><br><br><br><br><br><br><br><br><br>
        <!--후기-->
        <div><h3><b>의견 및 소감</b></h3></div> 
        
        <hr>
        
        <div class="review">
            <p>
            <b>강하나</b> <br>
            2021-05-21 <br>
            ★★★★ <br>
            깔끔하고 좋았음.
            </p>
        </div>

        <hr>

        <div class="review">
            <p>
            <b>김하늘</b> <br>
            2021-05-24 <br>
            ★★★★ <br>
            오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다 <br>
            이상의 꽃이 없으면 쓸쓸한 인간에 남는 것은 영락과 부패 뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게....
            </p>
        </div>
</div>       
	    <br><br><br><br>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>