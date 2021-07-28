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

    <link href="../../resources/css/styles.css" rel="stylesheet">
    
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

    <!-- 메인페이지 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

    <style>

      a { text-decoration:none !important } a:hover { text-decoration:none !important }       
         
      .TalkPageHeaderModule .column-filter-box-wrapper .column-filter-box-inner{
          display: flex;
          border:1px solid #d3d3d3;
          border-radius:5px;
          width: 93%;
      }
      
      .column-filter-box-inner>div{
          padding:5px 20px;
          text-align: center;
          cursor: pointer;
      }
  
  
      .column-filter-box-inner .on{
          background-color: rgb(220, 53, 69);
          color: white;
      }
  
      .column-filter-box-inner {
          color: black;
      }

      
      #column-select-btn{width: 100%;}


      .thumbnail{
        border: 1px solid white;
        display: inline-block;
        margin: 14px;
     }

     .thumbnail:hover{
        cursor: pointer;
        opacity:0.7;
    }

    .column-conetent{margin-top: 10px;}
    .thumbnail{margin-top: 50px;}
    .test1>div{display: inline-block;}


    </style>

</head>
<body>
    
     <!--메뉴바-->
        
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
    
    <!--전체 감싸는 div-->
    <div class="innerOuter" style="padding:5% 10%;">


        <div class="TalkPageHeaderModule header">
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
                   location.href="";
                }
                
                /*조회 기준(최신순,조회순,좋아요순) 클릭시 배경색 변경되는 JS*/
                $(document).on("click","#selectOption>div",function(){
                    $(this).toggleClass('on');
                    $(this).siblings().removeClass('on');
                })     

            </script>


            <div class="list-area" style="margin-top: 10px;">            
                <!--반복문 돌리기-->
                <div id="" class="thumbnail"style="margin-left:0px" >
                    <input type="hidden" value="">
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
                <!--반복문 돌리기-->
                <div id="" class="thumbnail"style="margin-left:0px" >
                    <input type="hidden" value="">
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
        
                <!--반복문 돌리기-->
                <div id="" class="thumbnail"style="margin-left:0px" >
                    <input type="hidden" value="">
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
                    $("#").click(function(){
                        //console.log($(this).children("input[type=hidden]").val());
                        // 반복문으로 생성된 게시글의 글 번호 받아오기 (ex.bno)
                        location.href="?="+$(this).children("input[type=hidden]").val();
                    })
                })
            </script>

                  

            <!--🔥페이징바 컬러 변경 예정🔥-->
            <div style="display:inline-block; margin-left: 400px; margin-top: 50px;">
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

        






     


</body>
</html>