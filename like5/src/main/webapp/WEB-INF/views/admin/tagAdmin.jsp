<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#star{
            color: yellow;
            size: 6x;
        }
        .starIcon{
            position:absolute;
            margin-left: 50px;
        }
        #tagTable {
            width: 900px;
            text-align: center;
            vertical-align: middle;
        }
        .outer{width: 1200px;}
        .outer {
            margin: auto;
        }
        .inner{
            width: 1100px;
            box-sizing: border-box;

        }
        .inner {
            margin: auto;
        }
        .inner>table{
            margin: auto;
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
        #updateTag{
            background-color:  rgb(220, 53, 69);
            color: white;
            border: 1px solid  rgb(220, 53, 69);
            border-radius: 3px;
        }
        #addTag{
            background-color:  rgb(220, 53, 69);
            color: white;
            border: 1px solid  rgb(220, 53, 69);
            border-radius: 3px;
            margin-left: 918px;
        }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	<br>
    
    <div class="outer">
        <!--폰트어썸 사용함-->
        <div class="starIcon">
            <i id="star" class="fas fa-star fa-stack-2x">TAGS</i>
            <i id="starBold" class="far  fa-star fa-stack-2x">TAGS</i>
        </div>
        <br>
        <hr>
        <br>
        <div class="inner">
            <!--모든 태그가 뿌려지고 -->
            <h5><b>관리자 전용 TAG관리 페이지</b> </h5>
            <button id="addTag"  data-toggle="modal" data-target="#insertModal">추가하기 </button>
            <br><br>
            <table class="table tagTable">
                <thead style="text-align: center;">
                    <tr>
                        <th>TAG번호</th>
                        <th>TAG명</th>
                        <th>총 게시글 수</th>
                        <th>수정하기</th>
                        <!-- 사실 수정하기 버튼 눌렀을 때 해당 TAG명을 수정할 수 있는 방법은 모르겠음...modal?-->
                    </tr>
                </thead>
                <tbody style="text-align: center;">
                    <tr>
                        <td>1</td>
                        <td>JAVA</td>
                        <td>124</td>
                        <td><button id="updateTag"  data-toggle="modal" data-target="#updateModal">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>JavaScript</td>
                        <td>234</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>C</td>
                        <td>2554</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>Python</td>
                        <td>345</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>Spring</td>
                        <td>1525</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>Html</td>
                        <td>153</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>Android</td>
                        <td>522</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>C++</td>
                        <td>8312</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>CSS/td>
                        <td>23</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>MySQL</td>
                        <td>71</td>
                        <td><button id="updateTag">수정하기</button></td>
                    </tr>
                </tbody>
            </table>
            <br>
        </div>
            <!-- 페이징 바 -->
        <div class="paging-area">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal" id="insertModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">Tag추가하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="">
                    <!-- Modal body -->
                    <div class="modal-body">
                        Tag : <input type="text" id="newTag" name="newTag">
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger" data-dismiss="modal">제출하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
  
    <div class="modal" id="updateModal">
        <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">Tag수정하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <form action="">
                    <!-- Modal body -->
                    <div class="modal-body">
                        Tag : <input type="text" id="updateTag" name="updateTag" value="JAVA">
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger" data-dismiss="modal">수정완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>




</body>
</html>