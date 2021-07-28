<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	table tbody{
		cursor:pointer;
	}
	.pagination {
	  justify-content: center;
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
        <div class="admin-box">
            <div class="admin-title">
                <h1>공간관리</h1>
            </div>
            <div class="admin-content">
                <div class="button-box">
                    <button class="btn btn-primary btn-sm" type="button"><a href="insertForm.bk">추가하기</a></button>
                    <button class="btn btn-warning btn-sm" type="button">삭제하기</button>
                </div>
                <table id="officeList" border="1">
                	<thead>
                	<tr>
                        <th>#</th>
                        <th>오피스번호</th>
                        <th>오피스타입</th>
                        <th>주소</th>
                        <th>매니저</th>
                    </tr>
                	</thead>
					<tbody>
					<c:forEach var="o" items="${ list }">
					<tr>
                        <td><input type="checkbox" name="" id=""></td>
                        <td class="ono">${ o.officeNo }</td>
                        <td>${ o.typeName }</td>
                        <td>${ o.address }</td>
                        <td>${ o.manager }</td>
                    </tr>
                    </c:forEach>
					</tbody>
                </table>
                <div class="pagination">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                        <c:choose>
                        	<c:when test="${ pi.currentPage eq 1 }">
	                        <li class="page-item disabled">
	                            <a class="page-link" href="#" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                            </a>
	                        </li>
                        	</c:when>
                        	<c:when test="${ empty condition }">
	                        <li class="page-item">
	                            <a class="page-link" href="list.bk?currentPage=${ pi.currentPage-1 }" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                            </a>
	                        </li>
                        	</c:when>
                        	<c:otherwise>
                        	<li class="page-item">
	                            <a class="page-link" href="list.bk?currentPage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}" aria-label="Previous">
	                            <span aria-hidden="true">&laquo;</span>
	                            </a>
	                        </li>
                        	</c:otherwise>
                        </c:choose>
                        
                        <c:forEach var="o" begin="${ pi.startPage }" end="${ pi.endPage }">
                        	<c:choose>
                        		<c:when test="${ empty condition }">
                        		<li class="page-item"><a class="page-link" href="list.bk?currentPage=${ o }">${ o }</a></li>
                        		</c:when>
                        		<c:otherwise>
                        		<li class="page-item"><a class="page-link" href="list.bk?currentPage=${ o }&condition=${condition}&keyword=${keyword}">${ o }</a></li>
                        		</c:otherwise>
                        	</c:choose>
                        </c:forEach>
                        
                        <c:choose>
                        	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                        <li class="page-item disabled">
	                            <a class="page-link" href="#" aria-label="Next">
	                            <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
                        	</c:when>
                        	<c:when test="${ empty condition }">
	                        <li class="page-item">
	                            <a class="page-link" href="list.bk?currentPage=${ pi.currentPage+1 }" aria-label="Next">
	                            <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
                        	</c:when>
                        	<c:otherwise>
                        	<li class="page-item">
	                            <a class="page-link" href="list.bk?currentPage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}" aria-label="Next">
	                            <span aria-hidden="true">&raquo;</span>
	                            </a>
	                        </li>
                        	</c:otherwise>
                        </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>

<script>
	$(function(){
		$("#officeList tbody tr").click(function(){
			location.href="detail.bk?ono=" + $(this).children().eq(1).text();
		})
	})
</script>
</body>
</html>