<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Community</title>
  
<!-- comDetailView.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/comDetailView.css" />   
 
</head>
<body>

    <!--메뉴바-->
    <jsp:include page="../../common/header.jsp" />
    
    <div class="innerOuter" style="margin-top:50px;padding-left:50px">
        <!--댓글창까지 전체 감싸는 div-->
        <div class="talk-main-col">
            
            <div class="content-wrapper">
                <div class="TalkContentHeaderModule">
                    <div>

                        <!--조건식으로 신고된 게시글은 아래의 이미지 보여지게끔 구현하기🔥
                        <div>
                            <img src="블라인드 게시글.jpg" style="width: 100%; height: 100%;"><img> 
                        </div>
                        -->

                        <h3><b>커뮤니티</b></h3><br>
                        <div class="content-header">
                            <div class="content-header-top">
                                <h4><b>VS Code 생각보다 괜찮네요</b></h4>
                            </div>
                            <div class="content-header-bottom">
                                <div class="left-items">
                                    <span>일상 | </span>
                                    <span>21-07-05 |</span>
                                    <span>작성자 닉네임</span>
                                </div>
                                
                                <div class="rigth-items">
                                    <span>조회 6 | </span>
                                    <span><a href="" class="aTags" data-toggle="modal" data-target="#report-modal">🚨신고</a></span>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="main-content" style="height: 500px;">

                            <div>내용이 보여지는 영역</div>
                          
                        </div>
                        <!--글작성자에게만 보여지는 버튼-->
                        <%-- <c:if test="${loginUser.userId != null}"></c:if>--%>
	                        <div class="content-footer" align="center">
	                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="postFormSubmit(1)">수정</button>
	                            <button type="button" class="btn btn-danger btn-sm" onclick="postFormSubmit(2)">삭제</button>
	                        </div>
	                        
	                        <form id="postForm" action="" method="post">
								<input type="hidden" name="bno" value="${b.boardNo}">
								<input type="hidden" name="filePath" value="${b.changeName}">
							</form>
							
							<script>
								function postFormSubmit(num){
									if(num==1){ // 수정하기
										$("#postForm").attr("action","comUpdateForm.bo").submit();
									 	// 선택된 요소에 액션값 부여하고, 바로 submit 시키기 == 메소드 체이닝
									}else{ // 삭제하기
										$("#postForm").attr("action","comDelete.bo").submit();
									}
								}
							</script>
                        
                        <hr>
                    </div>
                </div>
            </div>


            <form  id="" action="" method="post" style="margin-top: 0px;" >
                <!--ex.아이디랑 글 번호 넘겨서 삭제 (sql문에 따라 보내는 값을 달라질 수 있음)-->
                <input type="hidden" id="" name="" value="${loginUser.userId}" >
                <input type="hidden" id="" name="" value="${loginUser.userId}" >
                <!--신고하기 모달창-->
                <div class="container">
                    <!-- The Modal -->
                    <div class="modal fade" id="report-modal">
                        <div class="modal-dialog modal-dialog-centered modal-sm">
                            <div class="modal-content">
                            
                                <!-- Modal Header -->
                                <div class="modal-header" style="background-color: rgba(224, 224, 224, 0.24);">
                                    <h4 class="modal-title">🚨신고하기</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <!-- Modal body -->
                                <div class="modal-body">
                                   		 작성자 : 꼰대가르송(작성자 닉네임)
                                    <div class="modal-content" style="border:1px solid grey;width: 100%;height: 100%; border-radius: 5px;">
                                        <div>
                                            <b><span style="font-size: 15px;">사유 선택 : </span></b>
                                            <span>여러 사유에 해당되는 경우,</span>
                                            <div style="margin-left: 80px;">
                                                <span>대표적인 사유 1개를 선택해주세요.</span><br>
                                                
                                                <br>     
                                                <input type="radio" id="f-option" name="selector">
                                                <label for="f-option">부적절한 홍보 게시글</label>
                                                <br>

                                                <input type="radio" id="s-option" name="selector">
                                                <label for="s-option">욕설,비방 음란성등</label>
                                                <br>                               

                                                <input type="radio" id="t-option" name="selector">
                                                <label for="t-option">명예훼손, 사생활 침해</label>
                                                <br> 
                                                
                                                <input type="radio" id="o-option" name="selector">
                                                <label for="o-option">기타</label>
                                                <br>

                                            </div>
                                        </div>
                                        <div style="background-color: pink;">
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Modal footer -->
                                <div class="modal-footer" style="justify-content: center;">
                                    <div>
                                        <button type="submit" class="btn btn-danger btn-sm">신고하기</button>
                                        <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>    
            <!--댓글 전체 감싸는 영역-->
            
            <div class="talk-commentbox-wrapper" style="margin-bottom:50px">
                <div class="talk-comment-count-box">3개의 댓글</div>
                <div class="talk-newcomment-box">
                    <div class="auto-heigth" style="box-sizing: border-box; height: auto;">
                        <div style="height: 300px; width: 100%; border: 1px solid;">
                            <!--토스트 UI 들어오는 자리-->
                        </div>
                        <button type="button" class="btn-danger btn btn-sm" style="float:right; margin-top: 10px;">댓글 작성</button>
                    </div>
                </div>
                <div class="talk-comment-lists">
                    <div class="TalkCommentModule" >
                        <div class="comment-box-wrapper">

                            <!--댓글 조회목록-->
                            <div class="comment-wrapper_value" >
                                <div class="comment-info">
                                    <div class="info-wrapper">
                                        <div class="user-info">
                                            <div class="user-img">
                                                <i class="far fa-user fa-2x"></i>
                                            </div>
                                            <div class="user-info" style="display: inline-block;width: 90%;">
                                                <div class="test"> 
                                                    <span><a href="" class="aTags">사용자 닉네임</a></span>
                                                    <span style="float: right;"><a href="" class="aTags" data-toggle="modal" data-target="#report-modal"><img src="">🚨신고</a></span>
                                                 </div>
                                                <div>21-07-06</div>
                                            </div>
                                            
                                        </div>
                                        <div class="comment-content">
                                            <div>댓글 영역입니다.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--대댓글 조회 목록-->
                            <div class="comments-wrapper_value" >
                                <div class="comment-info">
                                    <div class="info-wrapper">
                                        <div class="user-info">
                                            <div class="user-img">
                                                <i class="far fa-user fa-2x"></i>
                                            </div>
                                            <div class="user-info" style="display: inline-block; width: 90%;">
                                                <span><a href="" class="aTags">사용자 닉네임</a></span>
                                                <span style="float: right;"><a href="" class="aTags" data-toggle="modal" data-target="#report-modal"><img src="">🚨신고</a></span>
                                                <div>21-07-06</div>
                                            </div>
                                            
                                        </div>
                                        <div class="comment-content">
                                            <div>대댓글 영역입니다.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!--대댓글 달기/취소하기 버튼-->
                            <div class="comment-plus-icon-wrapper" align="center">
                                <div class="container">
                                    <a href="#demo" id="comments" onclick="comments();" class="btn btn-outline-secondary" data-toggle="collapse" style="margin-bottom: 10px;">대댓글 달기</a>
                                    <div id="demo" class="collapse">
                                        <div class="talk-newcomment-box">
                                            <div class="auto-heigth" style="box-sizing: border-box; height: auto;">
                                                <div style="height: 300px; width: 100%; border: 1px solid;">
                                                    <!--토스트 UI 들어오는 자리-->
                                                </div>
                                                <button type="button" class="btn-danger btn btn-sm" style="float:right; margin-top: 10px;">대댓글 작성</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
                            
    <script>

        /*대댓글*/
        function comments(){

            var a = $("#comments").text();

            $("#comments").text("취소하기").on("click",function(){
              $("#comments").text("대댓글 달기");
                if(a == '대댓글 달기'){
                    comments();
                }
            });

        }

    </script>

	<!--푸터바-->
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>