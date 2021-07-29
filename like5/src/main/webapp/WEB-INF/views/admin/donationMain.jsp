<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        aside{
            float: left;
            margin-right: 50px;
        }
        .aside-title{
            padding: 30px 10px;
        }
        aside ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 130px;
            /* background-color: #f1f1f1; */
        }
        aside li{
            border: 1px lightgray solid;
        }

        aside li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
            text-align: center;
        }

        aside li a.active {
            background-color: rgb(220, 53, 69);
            color: white;
            text-decoration: none;
        }

        aside li a:hover:not(.active) {
            background-color: rgb(220, 53, 69);
            color: white;
            text-decoration: none;
        }

        .input-search{
            border: 1px solid #ced4da;
            border-radius: .25rem;
            height: 38px;
        }

        table{
            text-align: center;
        }
        form{
            display: flex;
        }
        .pagination{
            text-align: center;
            margin: auto;
        }
        .pagination li a.page-link{
            color: rgb(220, 53, 69);
        }
        .pagination .active a {
            background-color: rgb(220, 53, 69) !important;
            border: 1px solid white !important;
        }
        .page-link:hover{
            color: white !important;
        }
        
        #detailDo{
            background-color:  rgb(220, 53, 69);
            color: white;
            border: 1px solid  rgb(220, 53, 69);
            border-radius: 3px;
            width: 85px;
        }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="innerOuter">
	
		<div class="aside-title">
	        <i class="fi fi-spinner-cog fi-spin"></i>
	        <i class="fi fi-acrobat-reader"></i>
	        
	        <h3>통합관리</h3>
	       
	    </div>
	
	    <aside>
	     	<ul>
	              <li>
	                  <a  href="member.ad">회원관리</a>
	              </li>
	              <li>
	                  <a href="board.ad">게시글관리</a>
	              </li>
	              <li>
	                  <a href="customer.ad">고객센터</a>
	              </li>
	              <li>
	                  <a class="active" href="donation.ad">후원관리</a>
	              </li>
	              <li>
	                  <a href="booking.ad">공간대여관리</a>
	              </li>
	        </ul>
	    </aside>
	
	    <article>
	        <form id="searchBar" action="searchDona.ad" method="POST">
	            <select class="selectpicker" name="condition">
                    <option value="all" name="all">전체</option>
                    <option value="memName" name="memName">회원명</option>
                    <option value="nickName" name="nickName">닉네임</option>
                  </select>
	            <input type="text" class="form-control w-25">
	            <button class="btn btn-outline-danger">검색</button>
	        </form>
	
	        <br><br>
	
	        <table class="table-bordered table-sm" id="donationTable">
	            <thead>
	                <tr class="table-danger">
	                    <th >회원번호</th>
	                    <th width=80px;>회원명</th>
	                    <th width=100px;>닉네임</th>
	                    <th width=200px;>이메일</th>
	                    <th width=160px;>후원받은 금액</th>
	                    <th width=90px;>후원상세</th>
	                    <th width=150px;>정산받은 계좌</th>
	                    <!-- 이거 정산받은 계좌가 아니라 회원계좌(정산받을계좌)로 명칭 바꿔야 할 듯..? -->
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>23</td>
	                    <td>김망고</td>
	                    <td>mango</td>
	                    <td>mango1103@naver.com</td>
	                    <td>15,000원</td>
	                    <td><button id="detailDo" type="button" onclick="detailDonation();">상세조회</button></td>
	                    <td>3333083948583</td>
	                </tr>
	                
	            </tbody>
	        </table>
	
	        <br><br>
	            
	        <!-- <nav aria-label="Page navigation example"> -->
	            <ul class="pagination justify-content-center">
	                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
	                <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	            </ul>
	        <!-- </nav> -->
	
	        <br><br>
	
	
	    </article>
	</div>
    <script>
        function detailDonation(){
        	location.href="donaDetailOne.ad";
        }


    </script>
	
	
	
	
	
	
</body>
</html>