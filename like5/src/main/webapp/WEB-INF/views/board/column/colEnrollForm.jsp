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

	<!-- colEonrollForm.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/colEnrollForm.css" />  
	
    <!--토스트 UI-->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.css" />
    <!--플러그인-->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.min.css" />
    <link rel="stylesheet"href="https://uicdn.toast.com/editor-plugin-color-syntax/latest/toastui-editor-plugin-color-syntax.min.css"/>

    
 
</head>

<body>
   


   <!--메뉴바-->
    <jsp:include page="../../common/header.jsp" />   
 


    <div class="innerOuter" style="margin-top:50px; padding-left:50px">
        <div class="flex-box">
            <h2><b>칼럼</b></h2>
            <hr>
        </div>
        
     
         
         
            <!--카테고리 시작-->
            <!--작성자 아이디, 제목, 내용, 첨부파일-->
            <br>
            <div class="content-header">
                <div class="form-group">
                    <label for="content-title"><b>제목</b></label>
                    <input type="text" name="title" class="form-control" id="content-title" placeholder="5글자 이상을 입력해주세요." required>
                    <div id="counting-title" style="float: right; font-size: 11px"></div>
                </div>
            </div>

            <div class="content-body">
                <div class="form-group">
                    <label for="comment"><b>내용</b></label>
                    <!-- TOAST UI Editor가 들어갈 div 태그 -->
                    <div id="editor"></div>
                    <!-- TOAST UI 에디터 내용을 받을 div 태그 -->
                    <div id="editorContents"></div>
                    <div id="tui-color-picker-conatiner"></div>
                </div>
            </div>
            
		    <!--토스트 UI-->
		    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
		    
	        <!--🔥토스트 UI 컬러피커 작업중🔥-->
            <script src="https://uicdn.toast.com/tui-color-picker/latest/tui-color-picker.js"></script>

            <div class="content-footer">
                <div class="container-fluid" style="background-color: rgba(224, 224, 224, 0.3);">
                        Like5에 멋진 글을 작성해주셔서 감사드립니다 🧡<br>
                       	 청결한 게시판을 위해 
                                                       욕설이나 비방, 모욕, 선정성이 존재하는 사진이나 게시글은 업로드하지 말아주세요.
                </div>
            </div>
                
            <br><br>

            <div style="display: flex; justify-content: space-between;  margin-bottom:50px;margin-bottom:50px">
                <div>
                    <button type="reset" class="btn btn-outline-danger">취소</button>
                </div>
                <div class="submit-btn">
                    <button type="button" onclick="submit(2);" class="btn btn-outline-danger">임시저장</button>
                    <a data-toggle="modal" data-target="#thumbnail-modal"><button class="btn btn-danger">등록</button></a>
                </div>
            </div>

            <!--썸네일 insert 모달창-->
            <!-- The Modal -->
            <div class="modal fade" id="thumbnail-modal" >
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
                       		<form id="insertColumn" action="" method="post" style="margin-top: 0px;" enctype="multipart/form-data"> 
				             	<input type="hidden" name="mno" value="${loginUser.memNo}" >
					           	<input type="hidden" name="category" value="칼럼">
					           	<input type="hidden" name="title" value="">
					           	<input type="hidden" name="content" value="">
			                    <input type="file" id="thumbnail1" name=upfile onchange="loadImg(this,1)" class="form-control-file border" required>
				         	</form>  
		                </div>

                        <p style="font-size: 12px; margin-top: 15px; font-weight: bold;">
                            <!--🔥 사용자가 입력한 제목 보여지게끔 출력할 것 🔥-->
                      			      🔥 제목입니다 🔥
                        </p>
                    </div>

            
                    <!-- Modal footer -->
                    <div class="modal-footer"  style="justify-content: center;">
                        <button onclick="submit(1);" class="btn btn-danger btn-block">OK</button>
                    </div>
            	
                </div>
                </div>
            </div>
            
            <script>
            
	            /*토스트 UI 에디터 insert하기 */
	            function submit(num){
	            	
	            	// 등록하기
	            	if(num=1){
	            		// 제목과 내용 변수에 담아서 form에 담기
	            		var $title = $("#content-title").val()
	            		var content = editor.getHTML();
		            	$("#insertColumn").children().eq(2).attr("value",$title);
		            	$("#insertColumn").children().eq(3).attr("value",content);

		            	//form을 submit하기
	            		$("#insertColumn").attr("action","insert.bo").submit();
	            	}else{
	            		//임시저장
	            		
	            		
	            	}
	            	
	            	
	            }
            
            </script>
            
            
       
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
            location.href="colList.bo";
        }


    </script>
    
   	<!--푸터바-->
	<jsp:include page="../../common/footer.jsp" />

</body>
</html>