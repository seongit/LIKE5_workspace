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
	<c:if test="${ !empty loginUser && (loginUser.userStatus == 'Y') }">
		<div class="innerOuter">
			<div class="aside-title">
		        <i class="fi fi-spinner-cog fi-spin"></i>
		        <i class="fi fi-acrobat-reader"></i>
		        
		        <h3>????????????</h3>
		       
		    </div>
		
		    <aside>
		     	<ul>
		              <li>
		                  <a href="member.ad">????????????</a>
		              </li>
		              <li>
		                  <a href="board.ad">???????????????</a>
		              </li>
		              <li>
		                  <a href="customer.ad">????????????</a>
		              </li>
		              <li>
		                  <a class="active" href="donation.ad">????????????</a>
		              </li>
		              <li>
		                  <a href="list.bk">??????????????????</a>
		              </li>
		              <li>
            			  <a href="space.bo">??????????????????</a> <%--?????? ????????? ??? ?????? --%>
            		  </li>
		        </ul>
		    </aside>
		
		    <article>
		        <form id="searchBar" action="searchDona.ad" method="POST">
		            <select class="selectpicker" name="condition">
	                    <option value="all" name="all">??????</option>
	                    <option value="memName" name="memName">?????????</option>
	                    <option value="nickName" name="nickName">?????????</option>
	                  </select>
		            <input type="text" class="form-control w-25" name="keyword" value="${ keyword }">
		            <button type="submit" class="btn btn-outline-danger">??????</button>
		        </form>
				<script>
		        	$(function(){
		        		if("$(condition)" != ""){
		        			$("option[value=${condition}]").attr("selected", true);
		        		}
		        	})
		        </script>
		        <br><br>
		
		        <table class="table-bordered table-sm" id="donationTable" width="850px">
		            <thead>
		                <tr class="table-danger">
		                    <th >????????????</th>
		                    <th width=80px;>?????????</th>
		                    <th width=100px;>?????????</th>
		                    <th width=200px;>?????????</th>
		                    <th width=160px;>??? ???????????? ??????</th>
		                    <th width=90px;>????????????</th>
		                    <th width=150px;>???????????????</th>
		                    <!-- ?????? ???????????? ????????? ????????? ????????????(??????????????????)??? ?????? ????????? ??? ???..? -->
		                </tr>
		            </thead>
		            <tbody><!-- ????????? onclick????????? ?????? ??????(smem_no)????????? ?????? ???????????????! ??????????????? ??????????????? ?smemNo = ?????? ???????????????!!! -->
		                <c:forEach var="sp" items="${list}">
		                	<tr>
			                    <td class="smemNo" id="smemNo">${sp.smemNo }
			                    	<input type="hidden" value="${sp.smemNo }" name="smemNo">
			                    </td>
			                    <td>${sp.memName }</td>
			                    <td>${sp.nickName }</td>
			                    <td>${sp.email }</td>
			                    <td>${sp.sponFee }</td>
			                    <td><button id="detailDo" type="button" onclick="detailDonation(${sp.smemNo});">????????????</button></td>
			                    <td>${sp.accountNum }</td>
		                	</tr>
		                </c:forEach>
		            </tbody>
		        </table>
				<script>
			        var smemNo= "";
			        $(document).ready(function(){
		        		
		        	})
			       	function detailDonation(smemNo) {
			       			//location.href="donaDetailOne.ad?smemNo=" + smemNo;
			       			//console.log(smemNo);
			        	location.href="donaDetailOne.ad?smemNo=" + smemNo;
			        	
			       	}
			    </script>
		        <br><br>
		            
				<ul class="pagination justify-content-center">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<c:choose>
	                    		<c:when test="${!empty condition }">
	                    			<li class="page-item"><a class="page-link" href="searchDona.ad?currentPage=${pi.currentPage-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a></li>
	                   			</c:when>
	                    		<c:otherwise>
	                    			<li class="page-item"><a class="page-link" href="donation.ad?currentPage=${pi.currentPage -1 }">&laquo;</a></li>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </c:otherwise>
               		</c:choose>
	                <!-- ???????????????  -->
	                    	
	                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
	                	<c:choose>
	                		<c:when test="${!empty condition }">
	                			<li class="page-item"><a class="page-link" href="searchDona.ad?currentPage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="donation.ad?currentPage=${ p }">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
	                </c:forEach>
	                    
	                    	
	                <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link">&raquo;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<c:choose>
	                    		<c:when test="${ !empty condition }">
		                    		<li class="page-item"><a class="page-link" href="searchDona.ad?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="donation.ad?currentPage=${ pi.currentPage+1 }">&raquo;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
	                    </c:otherwise>
                    </c:choose>
                </ul>
		        <br><br>
		
		
		    </article>
		</div>
	    
	
	</c:if>
</body>
</html>