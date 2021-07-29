<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Column</title>

<!-- colListView.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colListView.css" />  

</head>
<body>
    
    <!--메뉴바-->
    <jsp:include page="../../common/header.jsp" />   
 
    <!--전체 감싸는 div-->
    <div class="innerOuter" style="margin-top:50px; padding-left:50px">


        <div class="TalkPageHeaderModule">
            <div class="column-filter-box-wrapper"  style="width: 280px;">
                <div><h2 class="column-header"><b>칼럼</b> &nbsp;&nbsp;</h2></div>
                
                <div>
                    <div id="column-select-btn">
                        <div class="column-filter-box-inner" id="selectOption" >
                            <div class="column-filter-item on">최신순</div>
                            <div class="column-filter-item " >조회순</div>
                            <div class="column-filter-item ">좋아요순</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--메인 시작-->
        <div class="main" id="columnList" style="width: 1000px; margin-top: 50px; margin-left: 0px;">
        
                
            <div style="margin-left:88%;">
                <button id="insertColumn" class="btn btn-danger" onclick="insertColumn();">글작성</button>
            </div>

            <script>

                /*글작성 버튼 클릭시 해당 페이지로 이동*/
                function insertColumn(){
                   location.href="colEnrollForm.bo";
                }
                
                /*조회 기준(최신순,조회순,좋아요순) 클릭시 배경색 변경되는 JS*/
                $(document).on("click","#selectOption>div",function(){
                    $(this).toggleClass('on');
                    $(this).siblings().removeClass('on');
                })     

            </script>


            <div class="list-area" style="margin-top: 10px;">            
                <!--반복문 돌리기-->
                <div class="thumbnail" id="col-bno" style="margin-left:0px" >
                    <input type="hidden" value="1"><!-- 명시적으로 value의 값은 1 - 수정 예정 -->
                    <img src="" style="width:300px; height: 250px;">
                    <div class="column-conetent">
                        <input type="hidden" class="">
                        <h6><b>구글 코리아 면접 후기</b></h6><br>
                        <span>21-07-02</span><br>
                        <div class="test1">
                            <div>by <b>gomjiellie</b></div>
                            <div style="margin-left: 170px; padding: 0;">👍<b>30</b></div>
                        </div>
                    </div>
                </div>
            </div>
            
			
            <script>
           
	            $(function(){
	            	 <%--$("#").click(function(){
	                        //console.log($(this).children("input[type=hidden]").val());
	                        // 반복문으로 생성된 게시글의 글 번호 받아오기 (ex.bno)
	                        location.href="?="+$(this).children("input[type=hidden]").val();
	                    })--%>
	            	 
	            	 $("#col-bno").click(function(){
	                     // [Test] 화면 확인 용 코드
	                     location.href="colDetail.bo";
	                })
	            });
            </script>
	
                  

            <!--🔥페이징바 컬러 변경 예정🔥-->
            <div style="display:inline-block; margin-left: 400px; margin-top: 50px; margin-bottom:50px">
                <!--페이징 시작-->
                <div id="pagingArea">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!--페이징 끝-->
        </div>
         <!--메인 끝-->
    <!--전체 감싸는 div-->
    </div>


 	<!--푸터바-->
	<jsp:include page="../../common/footer.jsp" />
     


</body>
</html>