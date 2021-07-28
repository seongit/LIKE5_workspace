<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2e27dda5cfdc6659ff812c6b423f97a&libraries=services,clusterer,drawing"></script>
    <!-- flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_red.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<style>
	.innerOuter{
		display:flex;
		margin-top:0 !important;
		padding-top:0;
        border:1px solid red;
	}
    .outcontainer{
        box-sizing: border-box;
        margin:0 60px;
        width: 100%;
        display: flex;
        border:1px solid blue;
    }
    .search-container{
        width: 100%;
        display: flex;
        position:sticky;
        z-index:3;
        background-color:#ffff;
        top:0px;
        justify-content: center;
        border-top:1px solid #e3e3e3;
        border-bottom: 1px solid #e3e3e3;
        height:60px;
    }
    .search-bar-container{
        display: flex;
        padding: 0 60px;
        height: 100%;
        align-items: center;
    }
    
    .input-container, .person{
        display: flex;
        height: 100%;

        border-radius: 32px;

    }
    .search-bar-container input[type=text]{
        height: 100%;
        padding: 0 30px;
        border:none;
        border-radius: 32px;
        background-color: rgb(255, 255, 255);
    }
    .search-bar-container input:hover, .branch-select li:hover{
        background-color: #F7F7F7 !important;
    }
    .sicon{
        padding-right: 10px;
    }
    .sicon>button{
        border-radius: 50%;
        width: 48px;
        height:48px;
        background-color: #eb3e3e;
        border:none;
    }
    .sicon i{
    	color:#ffff;
    }
    .box{
        display: flex;
        justify-content: space-between;
        position: absolute !important;
        box-shadow: rgb(0 0 0 / 20%) 0px 6px 20px !important;
        padding: 16px 32px;
        border-radius: 32px;
        background-color: rgb(255, 255, 255);
        z-index: 1;
        margin:12px 0 0 -153px;
        width: 330px;
        right: 0;
    }
    .text{
        font-size: 14px;
    }
    .stp{
        display: flex;
        justify-content: space-between;
        width:110px;
        height: 32px;
        align-self: center;
    }
    .stp .circle{
        display: inline-flex;
        border-radius: 50%;
        border: 1px solid rgb(176, 176, 176) !important;
        width: 32px;
        height: 32px;
        justify-content: center;
        color:rgb(113,113,113);
        background-color: transparent;
        align-items: center;
    }
    .outcontainer span{
        display:block;
        color:#666;
        text-align: left;
        margin: 25px;
    }
    .howmany input{
        border: none;
        border-radius: 50%;
        width:32px;
        height:32px;
        text-align: center;
        justify-content: center;
        font-weight: 400;
        color:rgb(34,34,34);
    }
    .result-container{
        width: 50%;
        position:relative;
    }
    .map-container{
        position: relative;
        width:50%;
    }
    #map{
        position: sticky !important;
        top:60px;
        z-index:1;
        height:calc(100vh - 48px);
        width: 100%;
        margin-left: 30px;
        overflow: hidden;
    }
    .result-list{
        padding-top:40px;
        width:100%;
    }
    .search-card{
        height:183px;
        width:100%;
        display:flex;
    }
    .card-img{
        width:40% !important;
        height:100%;
    }
    .card-img>img{
        height:100%;
        width:100%;
        border-radius: 4px 0 0 4px;
        object-fit: cover;
    }
    .card-content{
        width:60%;
        height:100%;
        border-radius: 0 4px 4px 0;
        border-width: 1px 1px 1px 0;
        border-style: solid;
        border-color:#e3e3e3;
        flex-direction: column;
        padding: 1rem 1.5rem;
    }
    .address{
        font-size: 12px;
    }
    .branch-select ul{
        position: relative;
        list-style: none;
        width:300px;
        margin: 0 -32px -8px !important;
        padding:8px 0;
    }
    .branch-select li{
        width: 100%;
        padding: 8px 16px 8px 32px !important;
        display: flex;
        cursor: pointer;
    }
    .marker{
        width:48px;
        height:48px;
        background-color: rgb(241, 241, 241);
        border-radius: 8px;
        margin-right:16px;
        display:flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
    }
    .region{
        display: flex;
        flex-direction: column;
        width: 100%;
        justify-content: center;
        color:rgb(34,34,34);
    }
    .branch-select{
        position:absolute;
        margin-top:12px;
        box-shadow: rgb(0 0 0 / 20%) 0px 6px 20px !important;
        padding: 30px 32px;
        z-index: 1;
        border-radius: 32px;
        background-color: #ffff;
        border:1px solid rgb(221,221,221);
    }
    #branch-modal{
        display: none;
    }
    #person-modal{
        display: none;
        position:relative !important;
    }
    .show-modal{
        display: block !important;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
        <div class="search-container">
            <div class="search-bar-container">
                <div class="input-container">
                    <input type="text" id="branch" name="branch" value="${ b.branch }">
                    <input class="fcheckIn" type="text" name="startDate" value="${ b.startDate }">
                    <input class="fcheckOut" type="text" name="endDate" value="${ b.endDate }">
                </div>
                <div class="person">
                    <input type="text" name="stp" id="pnum" value="${ b.person }">
                </div>
                <div class="sicon">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>
        <div id="branch-modal">
            <div class="branch-select">
                <ul>
                    <li>
                        <div class="marker"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="region">강남</div>
                    </li>
                    <li>
                        <div class="marker"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="region">마포</div> 
                    </li>
                    <li>
                        <div class="marker"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="region">합정</div>
                    </li>
                    <li>
                        <div class="marker"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="region">관악</div>
                    </li>
                </ul>
            </div>
        </div>
        <div id="person-modal">
            <div class="box">
                <div class="text">
                    <div class="tt">성인</div>
                    <div class="tdesc">만 13세 이상</div>
                </div>
                <div class="stp">
                    <button type="button" class='circle' onclick="minus();">
                        <span>-</span>
                    </button>
                    <div id="pp2" class="howmany">
                        <input type="text" id="num1" value="0">
                    </div>
                    <button type="button" class="circle" onclick="plus();">
                        <span>+</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="outcontainer">
            <div class="result-container">
                <span>${ list.size() }개의 결과</span>
                <c:forEach var="o" items="${ list }">
                <div class="result-list" onclick="location.href='detail.bo?ono=${ o.officeNo }'">
                    <div class="search-card">
                        <div class="card-img"><img src="${o.offImgPath }"></div>
                        <div class="card-content">
                            <h3>${ o.typeName }</h3>
                            <div class="address">${ o.address }</div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="map-container">
                <div id="map"></div>
            </div>
        </div>
<jsp:include page="../common/footer.jsp"/>
<script>
<%-- 모달 닫기 --%>
    const outcontainer = document.querySelector(".outcontainer");
	const pmodal = document.querySelector("#person-modal");//인원수 모달
    let branch = document.querySelector("#branch"); //지점 선택 input
    const bmodal = document.querySelector("#branch-modal"); //지점 모달
    let pp = document.querySelector("#pnum");//인원수 input
    let pp2 = document.querySelector("#num1");
    let regions = document.getElementsByClassName("region");

    branch.onclick = () => {
        bmodal.classList.add('show-modal');
    }
    pp.onclick = () => {
        pmodal.classList.add('show-modal');
    }
window.onclick = (e) => {
        e.target === outcontainer ? bmodal.classList.remove('show-modal') : false
        e.target === outcontainer ? pmodal.classList.remove('show-modal') : false
    }
    
<%-- 지역 선택 --%>
    for(let i=0; i<regions.length; i++){
        regions[i].addEventListener('click', function(){
            branch.value = regions[i].innerHTML
        })
    }

<%-- 인원수 선택 --%>
    function minus(){
        
        if(pp2.value > 0){
            pp2.value = Math.abs(Number(pp2.value)-1);
        }
        pp.value = pp2.value;
    }

    function plus(){
        
        pp2.value = Number(pp2.value)+1;
        pp.value = pp2.value;
    }
    
<%-- flatpickr --%>

	const checkIn = document.querySelector('.fcheckIn');
	const checkOut = document.querySelector('.fcheckOut');
	flatpickr(checkIn,{
	    locale:"ko",
	    altInput:true,
	    altFormat:"Y F d\\일",
	    minDate:"today",
	    //mode: "range",
	    dateFormat:"Y-m-d"
	});
	
	flatpickr(".fcheckOut",{
	    locale:"ko",
	    altInput:true,
	    altFormat:"Y F d\\일",
	    minDate:"today",
	    //mode: "range",
	    dateFormat:"Y-m-d"
	});
	
<%-- kakao map --%>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
    				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    				level: 5 // 지도의 확대 레벨
				};  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	<c:forEach var="o" items="${list}">
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${ o.address }', function(result, status) {

	// 정상적으로 검색이 완료됐으면 
 	if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    console.log(coords);
    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${o.branch}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
		}
	});
	</c:forEach>
</script>
</body>
</html>