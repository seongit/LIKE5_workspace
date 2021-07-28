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
  <link href="../../resources/css/styles.css" rel="stylesheet">
  
  <!-- 부트스트랩 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <!-- W3.CSS -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <!-- 폰트어썸 -->
  <script src="https://kit.fontawesome.com/1e56433357.js" crossorigin="anonymous"></script>

  <!-- 공통 폰트 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
    <style>
    a { text-decoration:none !important } a:hover { text-decoration:none !important }

      .content-header-bottom {
          padding-top:7px;
          padding-bottom: 8px;
          display: flex;
          justify-content: space-between;
      }
  
      .TalkContentHeaderModule{
          float: left;
          height: 100%;
          width:100%;
      }
  
      .talk-comment-count-box{
          font-size: 1.2rem;
          padding-top:10px;
          padding-bottom: 10px;
      }
  
      .TalkCommentModule .comment-info .user-img>*{
          height: 50px;
          width:50px;
          border-radius: 50px;
          margin-right: 10px;
          background-color:rgb(224, 224, 224) ;
          text-align: center;
          padding-top: 10px;
      }

      .TalkCommentModule{padding: 15px;}
      .TalkCommentModuleTemplate>* .TalkCommentModule>*{margin-top:30PX;}
      .talk-comment-lists{margin-top: 50px;}
      .user-info{display: flex;font-size: 12px;}
      .comment-content{
          margin-top: 10px;
          padding-left: 50px;
          height: 50px;
      }
  
      .comments-wrapper_value{
          background-color: ghostwhite;
          margin-left: 30px;
          margin-bottom: 15px;
          padding-left: 10px;
          padding-top: 30px;
      }
  
      .modal-body span{font-size: 9px;} 
      .modal-body {font-size: 12px;}
      .modal-content{padding: 5px;margin-top: 5px;}
  
    </style>
</head>
<body>

    
    <div class="header">
        <!-- 로고 -->
        <div id="header_logo" align=center>
            <a href="">
                <img src="https://i.imgur.com/5WiLp9Y.jpg" style="width:85px; height:50px;">
            </a>
        </div>

        <!-- 메뉴 -->
        <div id="header_navi">
            <ul id="menu">
                <li><a href="">LIKE5?</a></li>
                <li><a href="">QnA</a></li>
                <li><a href="">공간대여</a></li>
                <li><a href="">커뮤니티</a></li>
                <li><a href="">칼럼</a></li>
                <li><a href="">IT뉴스</a></li>
            </ul>
        </div>

        <!-- 로그인 -->
        <div id="header_user" style="text-align:center;">
            <!-- 로그인 전
            <div id="before_login">
                <a href="">로그인&nbsp;</a> | <a href="">&nbsp;회원가입</a>
            </div> -->

            <!-- 로그인 후 -->
            <div id="after_login">
                <div class="w3-dropdown-hover w3-center">
                    <!-- 사용자 닉네임 한글 기준 11자까지 배열에 딱 맞음 -->
                    <button class="w3-button w3-white">사용자 닉네임</button>
                    <div class="w3-dropdown-content w3-bar-block w3-border" style="right:0">
                    <a href="" class="w3-bar-item w3-button">마이페이지</a>
                    <a href="" class="w3-bar-item w3-button">내 프로필 보기</a>
                    <a href="" class="w3-bar-item w3-button">1:1문의</a>
                    <a href="" class="w3-bar-item w3-button">로그아웃</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 메뉴바 아래 회색 밑줄 -->
        <div class="underline"></div>
    </div>
    
    <div class="innerOuter" style="padding: 5% 10%;">
        <!--댓글창까지 전체 감싸는 div-->
        <div class="talk-main-col">
            
            <div class="content-wrapper">
                <div class="TalkContentHeaderModule">
                    <div>

                        <!--🔥조건식으로 신고된 게시글은 아래의 이미지 보여지게끔 구현하기🔥
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
                                    <span><a href="" class="aTags" data-toggle="modal" data-target="#report-modal"><img src="">🚨신고</a></span>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="main-content" style="height: 500px;">

                            <div>내용이 보여지는 영역</div>
                          
                        </div>
                        <!--글작성자에게만 보여지는 버튼
                        <div class="content-footer" align="center">
                            <button type="button" class="btn btn-outline-danger btn-sm">수정</button>
                            <button type="button" class="btn btn-danger btn-sm">삭제</button>
                           
                        </div>
                        -->
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
            
            <div class="talk-commentbox-wrapper">
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

     <!--푸터바 들어올 자리 -->


</body>
</html>