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
                    <h4><b>구글 코리아 면접 후기</b></h4>
                </div>
                <div class="content-header-bottom">
                    <div class="left-items">
                        <span>gomjellie   | </span>
                        <span>21-07-05 |</span>
                        <span>조회 6 </span>
                    </div>
                </div>
                <hr>
            </div>
        </div>
        <!--내용, 좋아요, 스크랩, 후원하기, 작성자 프로필, 수정, 삭제-->
        <div class="column-conetent"  style="width: 900px; height: 800px; ">
            <div style="height: 100%;width: 100%;">
                <div>
                    두 차례의 인터뷰가 모두 성공적이지 못해서 속으로 떨어졌구나 싶은 마음이 있었다. 근데 또 구글 코리아 면접에서는 피드백이 나쁘지 않은것같아서 나름 기대도 하고 있었다.

                    인터뷰가 끝나고 3주정도 있다가 결과를 메일로 받게되었다

                    메일 제목부터가 저희와 인터뷰를 진행해주셔서 감사합니다였다. 이런건 보통 감사합니다가 먼저나오면 불합격이고, 축하합니다가 먼저 나오면 합격인데 ㅠㅠ


                    아무래도 구글의 bar를 넘기에는 내가 부족했던것같다... 인터뷰까지 간것만으로도 운이 좋았다고 생각한다.<br>

                    이후에 진행한 다른회사 인터뷰는 하나도 떨어지진게 없는걸 보면, 구글 인터뷰를 준비하면서 인터뷰를 바라보는 방식이 바뀌게 되고 성장한것 같다

                    구글은 탈락했지만 다행히도 동시에 진행하고 있던 우아한 형제들(배민)의 채용연계형 교육과정에 합격해서 이번 여름 방학동안 참여하게 되었다 🎉             
                </div>
            </div>
            <!--좋아요 스크랩 후원하기-->
            <div>
                <div class="like-scrap-sponsorship" style="display: flex; margin-left: 40%; " >
                    <div class="like">
                        <i id="like" class="far fa-thumbs-up fa-2x"></i>
                        <i id="selected-like" class="fas fa-thumbs-up fa-2x" style="display: none;"></i>
                        <div>좋아요</div>
                    </div>
                    <div class="scrap">
                        <i id="scrap" class="far fa-bookmark fa-2x"></i>
                        <i id="selected-scrap" class="fas fa-bookmark fa-2x " style="display: none"></i>
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
            <!--후원하기 모달창-->
            <!-- The Modal -->
            <form  id="" action="" method="post" style="margin-top: 0px;" >
                <input type="hidden" id="" name="" value="${loginUser.userId}" >
                <input type="hidden" id="" name="" value="${loginUser.userId}" >
                        
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

                /*좋아요 아이콘 클릭시 변경되는 JS*/
                $('.like').click(function(){
                    
                    if($('#selected-like').css('display')=='none'){
                        $('#selected-like').css('display','block');
                        $('#like').css('display','none');
                    }else{
                        $('#selected-like').css('display','none');
                        $('#like').css('display','block');
                    }

                })

                /*스크랩 아이콘 클릭시 변경되는 JS**/
                $('.scrap').click(function(){

                    if($('#selected-scrap').css('display')=='none'){
                        $('#selected-scrap').css('display','block');
                        $('#scrap').css('display','none');
                    }else{
                        $('#selected-scrap').css('display','none');
                        $('#scrap').css('display','block');
                    }

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



            </script>


            <!--프로필 이미지 닉네임 / 수정 / 삭제 -->
            <div class="columnWriter"  style="display: flex;">
                
                <!--프로필이미지-->
                <div class="user-img">
                    <i class="far fa-user fa-2x"></i>
                </div>

                <!--닉네임-->
                <div class="user"style="line-height: 250%;">
                    <p><b>gomijellie</b></p>
                </div>
                <!--로그인한 사용자에게만 보여지는 아이콘
                <c:if test="${loginUser.userId eq b.boardWriter }"></c:if>-->

                <!--수정 삭제-->
                <div style="height: 30px; margin-left: 65%;"  >
                    <button class="btn btn-outline-danger btn-sm"  onclick="postFormSubmit(1)">수정하기</button>
                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-modal" >삭제하기</button>
                </div>   

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
                    <input type="hidden" id="" name="" value="${loginUser.userId}" >
                    <input type="hidden" id="" name="" value="${loginUser.userId}" >

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