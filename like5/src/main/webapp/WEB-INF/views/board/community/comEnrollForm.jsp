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
    
    <style>

        a { text-decoration:none !important } a:hover { text-decoration:none !important }
        .sidebar-item-wrapper {width: 13%;}
        .selectpicker {width: 100%;}
        .radius {border-radius: 3px;}
        
        .content-header .content-body .content-footer .flex-box {margin-bottom: 10px; } 
        
        .content-footer>div{width: 100%; padding: 10px;font-size: 18px; font-weight: 300;} 

        .file-upload {
        background-color: #ffffff;
        width: 100%;
        margin: 0 auto;
        padding: 20px;
        margin-top: 50px;
        margin-bottom: 50px;
        }

        .file-upload-btn {
        width: 100%;
        margin: 0;
        color: #fff;
        background: rgb(220, 53, 69);
        border: none;
        padding: 10px;
        border-radius: 4px;
        transition: all .2s ease;
        outline: none;
        text-transform: uppercase;
        font-weight: 700;
        }

        .file-upload-btn:hover {
        background:white;
        color: rgb(220, 53, 69);
        transition: all .2s ease;
        cursor: pointer;
        }

        .file-upload-btn:active {
        border: 0;
        transition: all .2s ease;
        }

        .file-upload-content {
        display: none;
        text-align: center;
        }

        .file-upload-input {
        position: absolute;
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        outline: none;
        opacity: 0;
        cursor: pointer;
        }

        .image-upload-wrap {
        margin-top: 20px;
        border: 4px dashed rgb(220, 53, 69);
        position: relative;
        }

        .image-dropping,
        .image-upload-wrap:hover {
        border: 4px dashed #ffffff;
        }

        .image-title-wrap {
        padding: 0 15px 15px 15px;
        color: #222;
        }

        .drag-text {
        text-align: center;
        }

        .drag-text p {
        font-weight: 100;
        text-transform: uppercase;
        color: black;
        padding: 60px 0;
        }

        .file-upload-image {
        max-height: 200px;
        max-width: 200px;
        margin: auto;
        padding: 20px;
        }

        .remove-image {
        width: 100%;
        margin: 0;
        color: rgb(220, 53, 69);
        border: none;
        padding: 10px;
        border-radius: 4px;
        transition: all .2s ease;
        outline: none;
        text-transform: uppercase;
        font-weight: 700;
        }

        .remove-image:hover {
        background: rgb(220, 53, 69);
        color: white;
        transition: all .2s ease;
        cursor: pointer;
        }

        .remove-image:active {
        border: 0;
        transition: all .2s ease;
        }

        .container-fluid {
            width: 500px;
        }

        textarea.form-control:focus, input:focus, input[type]:focus, .uneditable-input:focus {
            border-color: rgba(224, 224, 224, 0.3);
            box-shadow: 0 1px 1px rgba(229, 103, 23, 0.075) inset, 0 0 8px rgba(224, 224, 224, 0.3);
            outline: 0 none;
        }

        .underline {
        text-decoration: underline;
        text-decoration-color: rgb(220, 53, 69);
        }


    </style>

</head>
<body>

    <jsp:include page="../../common/header.jsp" /> 


    <div class="innerOuter">
        <div class="flex-box">
            <h2><b>커뮤니티</b></h2>
            <h6><b>질문은 QnA게시판을 이용해주세요.</b> </h6>
            <hr>
        </div>

        <form id="" action="" method="post" enctype="multipart/form-data">
            <input type="hidden" id="" value="${loginUser.userId}" name="">
            <!--카테고리 시작-->
            <!--작성자 아이디, 카테고리, 제목, 내용, 첨부파일-->
            <div class="community-header"> 
                <div class="sidebar-item-wrapper" >
                    <div class="category-tag-header-wrapper" style="margin-top: 10px; padding-top: 10px;" >
                        <h6 class="item-header"><b>카테고리 📚</b></h6>
                        <select class="selectpicker radius" name="">
                            <option>📕일상</option>
                            <option>📕커뮤니티</option>
                        </select>
                    </div>
                </div>
            </div>
            <br>

            <div class="content-header">
                <div class="form-group">
                    <label for="usr"><b>제목</b></label>
                    <input type="text" class="form-control" id="content-title" name=""  placeholder="5글자 이상을 입력해주세요.">
                    <div id="counting-title" style="float: right; font-size: 11px"></div>
                </div>
            </div>

            <div class="content-body">
                <div class="form-group">
                    <label for="comment"><b>내용</b></label>
                    <textarea class="form-control" id="comment" name="" rows="10"  style="resize: none;" ></textarea>
                </div>
            </div>
            <div class="file-upload" style="padding: 0px;">
                <!--<button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">첨부파일 등록하기</button>-->
            
                <div class="image-upload-wrap">
                <input class="file-upload-input"  name="" type='file' onchange="readURL(this);" accept="image/*" />
                <div class="drag-text">
                    <p>업로드하고 싶은 파일을 드래그 해보세요😜</p>
                </div>
                </div>

                <div class="file-upload-content">
                <img class="file-upload-image" src="#" alt="your image" />
                <div class="image-title-wrap">
                    <button type="button" onclick="removeUpload()" class="remove-image"><span class="image-title"></span>를 수정하시겠어요?</button>
                </div>
                </div>
                
            </div>

            <div class="content-footer">
                <div class="container-fluid" style="background-color: rgba(224, 224, 224, 0.3);">
                        Like5에 멋진 글을 작성해주셔서 감사드립니다 🧡<br>
                        청결한 게시판을 위해 
                        욕설이나 비방, 모욕, 선정성이 존재하는 사진이나 게시글은 업로드하지 말아주세요.
                </div>
            </div>
            <br><br>

            <div style="display: flex; justify-content: space-between;">
                <button type="reset" class="btn btn-outline-danger">취소</button>
                <button type="submit" class="btn btn-danger">등록</button>
            </div>
        </form>    

        <script>


            /*커뮤니티-제목-글자수 실시간 카운팅*/
            $('#content-title').keyup(function(e){
                var title = $(this).val();

                //공백제거
                if(title.trim() != 0){
                    $('#counting-title').html(title.length+" / 49");    //글자수 실시간 카운팅
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

            // 첨부파일 업로드
            function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();

                reader.onload = function(e) {
                $('.image-upload-wrap').hide();

                $('.file-upload-image').attr('src', e.target.result);
                $('.file-upload-content').show();

                $('.image-title').html(input.files[0].name);
                };

                reader.readAsDataURL(input.files[0]);

            } else {
                removeUpload();
            }
            }
            
            // 업로드한 파일 수정 = 제거
            function removeUpload() {
            $('.file-upload-input').replaceWith($('.file-upload-input').clone());
            $('.file-upload-content').hide();
            $('.image-upload-wrap').show();
            }
            $('.image-upload-wrap').bind('dragover', function () {
                    $('.image-upload-wrap').addClass('image-dropping');
                });
                $('.image-upload-wrap').bind('dragleave', function () {
                    $('.image-upload-wrap').removeClass('image-dropping');
            });




        </script>

    </div>

</body>
</html>