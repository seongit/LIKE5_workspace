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
    
  	<!-- colDetailView.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colDetailView.css" />   
  
</head>
<body>

     <!--메뉴바-->
     <jsp:include page="../../common/header.jsp" />   
    
    <div class="innerOuter" style="margin-top:50px; padding-left:50px">
        <!--칼럼, 제목, 작성자 닉네임, 작성일, 조회수-->
        <div class="column-header">
            <div class="content-header">
                <h3><b>칼럼</b></h3><br>
                <div class="content-header-top">
                    <h4><b>${b.title}</b></h4>
                </div>
                <div class="content-header-bottom">
                    <div class="left-items">
                        <span>${b.nickname}   | </span>
                        <span>${b.enrollDate} |</span>
                        <span>조회수 ${b.count} </span>
                    </div>
                </div>
                <hr>
            </div>
        </div>
        <!--내용, 좋아요, 스크랩, 후원하기, 작성자 프로필, 수정, 삭제-->
        <div class="column-conetent"  style="width: 900px; height: 800px; ">
            <div style="height: 100%;width: 100%;">
                <div>
                	${b.content}
                </div>
            </div>
            <!--좋아요 스크랩 후원하기-->
            <!-- 로그인한 사용자만 버튼 요소 보여지게하기 -->
            <c:choose>
            	<c:when test="${!empty loginUser }">
           	   <div>
	                <div class="like-scrap-sponsorship" style="display: flex; margin-left: 40%; " >
	                    <div class="like" onclick="likeAndScrap(1);">
	                    	<c:choose>
	                    		<c:when test="${!empty likes}">
			                        <i id="selected-like" class="fas fa-thumbs-up fa-2x"></i>
	                    		</c:when>
	                    		<c:when test="${!empty scrap && !empty likes}">
	                    			 <i id="selected-like" class="fas fa-thumbs-up fa-2x"></i>
	                    		</c:when>
	                    		<c:otherwise>
			                        <i id="like" class="far fa-thumbs-up fa-2x" ></i>
			                        <i id="selected-like" class="fas fa-thumbs-up fa-2x test" style="display:none;"></i>
			                        <i id="like" class="fas fa-thumbs-up fa-2x test" style="display:none;"></i>
	                    		</c:otherwise>
	                        </c:choose>
	                        <div>좋아요</div>
	                    </div>
	                    <div class="scrap" onclick="likeAndScrap(2);">
	                    	<c:choose>
	                    		<c:when test="${!empty scrap}">
	                    			<i id="selected-scrap" class="fas fa-bookmark fa-2x"></i>
	                    		</c:when>
	                    		<c:when test="${!empty scrap && !empty likes}">
	                    			<i id="selected-scrap" class="fas fa-bookmark fa-2x"></i>
	                    		</c:when>
	                    		<c:otherwise>
	                       			 <i id="scrap" class="far fa-bookmark fa-2x"></i>
	                       			 <i id="selected-scrap" class="fas fa-bookmark fa-2x" style="display:none;"></i>
	                       			 <i id="scrap" class="fas fa-bookmark fa-2x" style="display:none;"></i>
                       			</c:otherwise>
	                        </c:choose>
	                        <div>스크랩</div>
	                    </div>
	                    <div class="sponsorship"> 
	                        <!--기본으로 보여지는 아이콘-->
	                        <a data-toggle="modal" data-target="#sponsorship-modal"><i id="sponsorship" class="far fa-heart fa-2x"></i></a>
	                        <!--후원하기 클릭시 변경되는 아이콘-->
	                        <i id="selected-sponsorship" class="fas fa-heart fa-2x" style="display: none;"></i>
	                        <div>후원하기</div>
	                    </div>
	               	</div>
            	</div><br><hr>
            	</c:when>
            </c:choose>
            
            <!--후원하기 모달창-->
            <!-- The Modal -->
            <form  id="" action="" method="post" style="margin-top: 0px;" >
                <input type="hidden" id="" name="" value="${loginUser}" >
                <input type="hidden" id="" name="" value="${loginUser}" >
                        
                <div class="modal fade" id="sponsorship-modal">
                    <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title"><b>💌후원하기</b></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body" style="text-align: center;">
				                            답변이 마음에 드셨다면 <br>
				                            해당 작성자에게 후원할 수 있습니다.<br>
				                            후원하시겠어요?
                            <p style="font-size: 9px;">
                                (OK 버튼 클릭 시 결제창으로 이동합니다.)
                            </p>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer"  style="justify-content: center;">
                            <button type="submit" class="btn btn-danger btn-block">OK</button>
                        </div>
                    </div>
                    </div>
                </div>
            </form>
                        


            <script>

                /*좋아요 아이콘 클릭시 변경되는 JS
                $('.like').click(function(){
                    
                    if($('#selected-like').css('display')=='none'){
                        $('#selected-like').css('display','block');
                        $('#like').css('display','none');
                    }else{
                        $('#selected-like').css('display','none');
                        $('#like').css('display','block');
                    }

                })
                */

                /*스크랩 아이콘 클릭시 변경되는 JS
                $('.scrap').click(function(){

                    if($('#selected-scrap').css('display')=='none'){
                        $('#selected-scrap').css('display','block');
                        $('#scrap').css('display','none');
                    }else{
                        $('#selected-scrap').css('display','none');
                        $('#scrap').css('display','block');
                    }

                })
                */
                
                $("#selected-like").click(function(){
                	
                })
                

                /* 후원 아이콘 클릭시 변경되는 JS*/
                /*후원의 경우 DB에 insert된다면 변경되게끔 구현하기*/
                $('.sponsorship').click(function(){

                if($('#selected-sponsorship').css('display')=='none'){
                    $('#selected-sponsorship').css('display','block');
                    $('#sponsorship').css('display','none');
                }else{
                    $('#selected-sponsorship').css('display','none');
                    $('#sponsorship').css('display','block');
                }

                })
                
                /* 좋아요 | 스크랩 공통 모듈 [백업용]
                function likeAndScrap(num){
                	if(num == 1 ){
                		$("#insertForm").children().eq(2).attr("value","like");
                		$("#insertForm").attr("action","likeAndScrap.bo").submit();
                	}else{
                		$("#insertForm").children().eq(2).attr("value","scrap");
                		$("#insertForm").attr("action","likeAndScrap.bo").submit();
                	}
                }
                
                */

                // 1 = 좋아요 | 2 = 스크랩
                function likeAndScrap(num){
                	if(num == 1){
                		$("#like").click(function(){
                			// 좋아요 버튼 클릭 시 
                    		$.ajax({
                    			url:"likeAndScrap.bo"
                    			,data:{bno:${b.bno}
                    				 ,mno:${loginUser.memNo}
                    				 ,condition:"like"
                    				 }
                    			,success:function(status){
                    				if(status=="success"){
                    					alertify.alert("좋아요 성공!🎉");
                    					$('#selected-like').css('display','block');
                    					$('#like').css('display','none');
                    				}
                    			}
                    		})
                		})
                		
                		// 좋아요 해제
                		$("#selected-like").click(function(){
                			$.ajax({
                    			url:"UnlikeAndUnScrap.bo"
                    			,data:{bno:${b.bno}
                    				 ,mno:${loginUser.memNo}
                    				 ,condition:"like"
                    				 }
                    			,success:function(status){
                    				if(status=="success"){
                    					alertify.alert("좋아요 해제😅");
                    					$('#like').css('display','block');
                    					$('#selected-like').css('display','none');
                    				}
                    			}
                    		})
                			
                		})
                	}
                	
                	
                	
                	if(num == 2){
                		
                		$("#scrap").click(function(){
	                		// 스크랩 버튼 클릭 시 
	                		$.ajax({
	                			url:"likeAndScrap.bo"
	                			,data:{bno:${b.bno}
	                				 ,mno:${loginUser.memNo}
	                				 ,condition:"scrap"
	                				 }
	                			,success:function(status){
	                				if(status=="success"){
	                					alertify.alert("스크랩 성공!🎉");
	                				   $('#selected-scrap').css('display','block');
	                				   $('#scrap').css('display','none');
	                				}
	                			}
	                		})
                		})
                		
                		$("#selected-scrap").click(function(){
                			$.ajax({
	                			url:"UnlikeAndUnScrap.bo"
	                			,data:{bno:${b.bno}
	                				 ,mno:${loginUser.memNo}
	                				 ,condition:"scrap"
	                				 }
	                			,success:function(status){
	                				if(status=="success"){
	                					alertify.alert("스크랩 해제 😅");
	                				   $('#selected-scrap').css('display','none');
	                				   $('#scrap').css('display','block');
	                				}
	                			}
	                		})
                		})
                		
                	}
                }
                
                
                
            </script>
            
            <!-- 좋아요와 스크랩  -->
          	<form id="insertForm" action="" method="post">
				<input type="hidden" name="bno" value="${b.bno}">
				<input type="hidden" name="mno" value="${loginUser.memNo}">
				<input type="hidden" name="condition" value="">
			</form>


            <!--프로필 이미지 닉네임 / 수정 / 삭제 -->
            <div class="columnWriter"  style="display: flex;">
                
                <!--프로필이미지-->
                <div class="user-img">
                    <i class="far fa-user fa-2x"></i>
                </div>

                <!--닉네임-->
                <div class="user"style="line-height: 250%;">
                    <p><b>${b.nickname}</b></p>
                </div>
                
                <!--로그인한 사용자에게만 보여지는 아이콘-->
                <c:choose>
                	<c:when test="${loginUser.memNo eq b.mno}">
	               	     <div style="height: 30px; margin-left: 65%;"  >
	                    	<button class="btn btn-outline-danger btn-sm" onclick="postFormSubmit(1)">수정하기</button>
	                   		<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-modal" >삭제하기</button>
	               		</div> 
                	</c:when>
                </c:choose>

                <!--수정 삭제-->
             

                <!--삭제시 필요한 키값 숨겨서 보내기--> 
                <form id="test" action="" method="post">
                    <input type="hidden" name="" value="">
                    <input type="hidden" name="" value="">
                </form>

                <!--선택된 요소에 액션값 부여하고, 바로 submit 시키기-->     
                <script>
                function postFormSubmit(num){
                    if(num==1){ // 수정하기
                        $("#").attr("action","url주소").submit();
                    }else{ // 삭제하기
                        $("#").attr("action","url주소").submit();
                    }
                }
                </script>

                <!--삭제하기 모달창-->
                <!-- The Modal -->
                <form  id="" action="" method="post" style="margin-top: 0px;" >
                    <!--ex.아이디랑 글 번호 넘겨서 삭제 (sql문에 따라 보내는 값을 달라질 수 있음)-->
                    <input type="hidden" id="" name="" value="${loginUser}" >
                    <input type="hidden" id="" name="" value="${loginUser}" >

                    <div class="modal fade" id="delete-modal">
                        <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>게시글 삭제</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <!-- Modal body -->
                            <div class="modal-body" style="line-height: 100%;">
                                삭제시, 복구가 불가능합니다. <br>
                                삭제하시겠습니까?
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer" style="display: flex; justify-content: space-between;" >
                                <button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-danger"  onclick="postFormSubmit(2)">삭제</button>
                            </div>
                        </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>         


        <!--관심 있을 만한 컬럼-->
        <div class="column-footer" style="margin-top: 300px; margin-bottom:50px">
            <div style="margin-left: 10px; margin-bottom: 30px;">
                <h4><b>관심 있을 만한 칼럼</b></h4>
            </div>
            <!--좋아요 수 TOP 4 썸네일 조회하기-->
            <!--반복문 생성하는 구간-->
            <div class="thumbnail">
                <div>
                    <img src="" style="width:400px; height: 300px;">
                    <div style="margin-top: 10px;"><b>당근 면접 후기 및 회고</b></div>
                </div>
            </div>
            <!--반복문 생성하는 구간-->
            <div class="thumbnail">
                <div>
                    <img src="" style="width:400px; height: 300px;">
                    <div style="margin-top: 10px;"><b>당근 면접 후기 및 회고</b></div>
                </div>
            </div>
            <!--반복문 생성하는 구간-->
            <div class="thumbnail">
                <div>
                    <img src="" style="width:400px; height: 300px;">
                    <div style="margin-top: 10px;"><b>당근 면접 후기 및 회고</b></div>
                </div>
            </div>
            <!--반복문 생성하는 구간-->
            <!--반복문 생성하는 구간-->
            <div class="thumbnail">
                <div>
                    <img src="" style="width:400px; height: 300px;">
                    <div style="margin-top: 10px;"><b>당근 면접 후기 및 회고</b></div>
                </div>
            </div>
            <!--반복문 생성하는 구간-->
        </div>   
    </div>

	<!--푸터바-->
	<jsp:include page="../../common/footer.jsp" />


    
</body>
</html>