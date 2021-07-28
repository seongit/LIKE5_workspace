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

    <!--토스트 UI-->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
    <!--플러그인-->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
    <link rel="stylesheet"href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css"/>

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
        textarea.form-control:focus, input:focus, input[type]:focus, .uneditable-input:focus {
            border-color: rgba(224, 224, 224, 0.3);
            box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(224, 224, 224, 0.3);
            outline: 0 none;
        }

        .submit-btn>button{margin-left: 10px;}

        .innerOuter>*{margin-top: 30px;}

        
    </style>
 
</head>

<body>
   
    <!--토스트 UI-->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>


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
    



    <div class="innerOuter">
        <div class="flex-box">
            <h2><b>칼럼</b></h2>
            <hr>
        </div>
        <form  id="" action="" method="post" style="margin-top: 0px;" enctype="multipart/form-data">
            <input type="hidden" id="" value="${loginUser.userId}" name="">
            <!--카테고리 시작-->
            <!--작성자 아이디, 제목, 내용, 첨부파일-->
            <br>
            <div class="content-header">
                <div class="form-group">
                    <label for="content-title"><b>제목</b></label>
                    <input type="text" name="" class="form-control" id="content-title" placeholder="5글자 이상을 입력해주세요." required>
                    <div id="counting-title" style="float: right; font-size: 11px"></div>
                </div>
            </div>

            <div class="content-body">
                <div class="form-group">
                    <label for="comment"><b>내용</b></label>
                    <div id="editor"><textarea name=""></textarea></div>
                    <div id="tui-color-picker-conatiner"></div>
                </div>
            </div>

            <div class="content-footer">
                <div class="container-fluid" style="background-color: rgba(224, 224, 224, 0.3);">
                        Like5에 멋진 글을 작성해주셔서 감사드립니다 🧡<br>
                        청결한 게시판을 위해 
                        욕설이나 비방, 모욕, 선정성이 존재하는 사진이나 게시글은 업로드하지 말아주세요.
                </div>
            </div>
                
            <!--🔥토스트 UI 컬러피커 작업중🔥
            <script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.js"></script>-->
            

            <br><br>

            <div style="display: flex; justify-content: space-between;">
                <div>
                    <button type="reset" class="btn btn-outline-danger">취소</button>
                </div>
                <div class="submit-btn">
                    <button type="button" onclick="temSave();" class="btn btn-outline-danger">임시저장</button>
                    <a data-toggle="modal" data-target="#thumbnail-modal"><button class="btn btn-danger">등록</button></a>
                </div>
            </div>

            <script>
  
            </script>

            <!--썸네일 insert 모달창-->
            <!-- The Modal -->
            <div class="modal fade" id="thumbnail-modal">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h6 class="modal-title"><b>포스트 미리보기</b></h6>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: center;">
                        <a id="thumbnail-tooltip" data-toggle="tooltip" title="썸네일을 등록해주세요😊">
                            <img id="thumbnail" width="150px" height="150px">
                        </a>

                        <div class="input-type" id="file-area">
		                    <input type="file" id="thumbnail1" name="" onchange="loadImg(this,1)" class="form-control-file border" required>
		                </div>

                        <p style="font-size: 12px; margin-top: 15px; font-weight: bold;">
                            <!--🔥 사용자가 입력한 제목 보여지게끔 출력할 것 🔥-->
                            🔥 제목입니다 🔥
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
    </div>



    <script>

        /*토스트 UI*/
        const Editor = toastui.Editor;
        const editor = new Editor({
            el: document.querySelector('#editor'),
            height: '600px',
            previewStyle: 'vertical',
            initialValue: '📝당신의 한 줄이 개발자들의 영감이 됩니다.',
            language: 'ko',
        });

        /*첨부파일-div 영역 클릭시 첨부파일 등록*/
        $(function(){
            
            $("#file-area").hide();
            $("#thumbnail").click(function(){
                $("#thumbnail1").click();	
            })
        })
        
        /*첨부파일-미리보기*/
        function loadImg(inputFile,num){
            
            if(inputFile.files.length == 1){
                var reader = new FileReader();
                    
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                        $("#thumbnail").attr("src",e.target.result);
                        $('[data-toggle="tooltip"]').attr("data-original-title","멋진사진이네요!👍");
                    }

            }else{
                /*🔥기본 이미지는 Like5로고로 넣을 것🔥*/
                $("#thumbnail").attr("src",null);
                $('[data-toggle="tooltip"]').attr("data-original-title","썸네일을 등록해주세요😊");
            }
                
        }

        /*첨부파일-미리보기-썸네일호버-툴팁*/
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });


        /*칼럼-제목-글자수 실시간 카운팅*/
        $('#content-title').keyup(function(e){
            var title = $(this).val();

            
            if(title.trim() != 0){
                $('#counting-title').html(title.length+" / 49");  
            }else{
                alert("공백이 입력되었어요 😊 다시 입력해주세요 ");
                $('#counting-title').html(''); 
            }
            
            if (title.length > 49){
                alert("최대 49자까지 입력 가능합니다.");
                $(this).val(title.substring(0, 49));
                $('#counting-title').html("49 / 49");
            }
        });
        /*임시저장 alert*/
        function temSave(){
            alert("성공적으로 임시저장 되었습니다👍");
            /*커뮤니티-전체보기 페이지로 이동*/
            location.href="";
        }


    </script>

</body>
</html>