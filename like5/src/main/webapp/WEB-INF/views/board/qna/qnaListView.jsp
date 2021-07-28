<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- qnaListView.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaListView.css" />

</head>

<body>
	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp"/>

	<!-- [한솔] QnA 게시글 리스트 페이지 -->
	<div class="innerOuter" id="innerOuter">
		<!-- 전체를 감싸는 div -->
		<div class="qnaMain" id="qnaMain">

			<!-- 게시판 제목이 들어갈 부분 -->
			<div class="qnaMain_top1" id="top_name"><h2><b>QnA</b></h2></div>

			<!--
		        ** 기능 작업 시 참고 **
		        1) 내가 쓴 게시글 tr background-color : lightgrey
		        2) 답변 채택된 게시글 td background-color : rgb(220, 53, 69)
		        3) 답변이 있으나 채택되지 않은 게시글 td background-color : lightgrey
		            > 3번은 중요도 최하고 1, 2 구현 시 상황봐서 제외해도 됨
      		-->
			<!-- 게시판 기타 기능이 들어갈 부분 (최신순, 검색기능 등) -->
			<div class="qnaMain_top2">
				<!-- 정렬 리스트를 나누는 div -->
				<div class="qnaList">
					<div class="qnaList_new"><a href="">최신순</a></div>
					<div class="qnaList_like"><a href="">좋아요순</a></div>
					<div class="qnaList_reply"><a href="">답변순</a></div>
					<div class="qnaList_view"><a href="">조회순</a></div>
				</div>
				<!-- 정렬 리스트를 나누는 div 끝-->

				<!-- 중간 배열 div -->
				<div class="qnaMiddle"></div>
				<!-- 중간 배열 div 끝 -->

				<!-- 검색, 질문하기를 나누는 div -->
				<div class="qnaSearch">
					<div class="qnaSearch_tip">⭐ 검색 팁!
						<!-- hover 시 나타나는 검색 툴팁 -->
						<span class="tooltiptext">
							＊ 일반 단어 입력 후 검색 시 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							'키워드' 검색이 가능해요! <br>
							＊ 단어에 해시태그(#)를 붙이고 검색 시 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							'태그' 검색이 가능해요!
						</span>
					</div>
					<div class="qnaSearch_retrieve">
						<input type="text" placeholder="검색어를 입력해보세요">
						<button><i class="fas fa-search"></i></button>
					</div>
					<div class="qnaSearch_question">
						<button type="button" class="btn btn-danger"><a href="qEnrollForm.bo">질문하기</a></button>
					</div>
				</div>
				<!-- 검색, 질문하기를 나누는 div 끝 -->
			</div>
			<!-- 게시판 기타 기능이 들어갈 부분 끝-->

			<!-- 게시판 중/하단 모두를 감싸는 div -->
			<div class="qnaContent">
				<!-- 게시글 리스트가 들어갈 부분 -->
				<div class="qnaBoard_main">
					<table class="w3-table w3-bordered w3-hoverable">

						<!-- 게시글 리스트 시작 -->
						<thead><tr><th></th><th></th><th></th><th></th><th></th></tr></thead>
						<tr>
							<!-- 좋아요 시작 -->
							<td class="qnaLike">
								<!-- 좋아요 상/중/하단 나누는 div-->
								<div id="qnaLike_1"></div>
								<div id="qnaLike_2">
									<!-- 좋아요 좌/우 나누는 div-->
									<div id="qnaLike_4"><i class="far fa-thumbs-up"></i></div>
									<div id="qnaLike_5"><!-- 좋아요 수 데이터 값-->0</div>
									<!-- 좋아요 좌/우 나누는 div 끝-->
								</div>
								<div id="qnaLike_3">좋아요</div>
								<!-- 좋아요 상/중/하단 나누는 div 끝-->
							</td>
							<!-- 좋아요 끝 -->

							<!-- 답변 시작 -->
							<td class="qnaReply">
								<!-- 답변 상/중/하단 나누는 div-->
								<div id="qnaReply_1"></div>
								<div id="qnaReply_2">
									<!-- 답변 좌/우 나누는 div-->
									<div id="qnaReply_4"><i class="far fa-comment-dots"></i></div>
									<div id="qnaReply_5"><!-- 답변 수 데이터값 -->3</div>
									<!-- 답변 좌/우 나누는 div 끝 -->
								</div>
								<div id="qnaReply_3">답변</div>
								<!-- 답변 상/중/하단 나누는 div 끝-->
							</td>
							<!-- 답변 끝 -->

							<!-- 조회수 시작 -->
							<td class="qnaView">
								<!-- 조회수 상/중/하단 나누는 div-->
								<div id="qnaView_1"></div>
								<div id="qnaView_2">
									<!-- 조회수 좌/우 나누는 div-->
									<div id="qnaView_4"><i class="far fa-eye"></i></div>
									<div id="qnaView_5"><!-- 조회수 수 데이터값 -->2</div>
									<!-- 조회수 좌/우 나누는 div 끝-->
								</div>
								<div id="qnaView_3">조회수</div>
								<!-- 조회수 상/중/하단 나누는 div 끝-->
							</td>
							<!-- 조회수 끝 -->

							<!-- 게시글 시작 -->
							<td class="qnaContent">
								<!-- 게시글 상/하단 나누는 div -->
								<div id="qnaTitle">
									<!-- 게시글 제목, 클릭 시 게시글 상세페이지로 이동-->
									<!-- 추후 작업 후 링크 다시 확인할 것 -->
									<a href="qDetail.bo">보름달일때는 이클립스가 안켜지나용?</a>
								</div>
								<div id="qnaTag">
									<!-- 게시글에 첨부된 태그 -->
									<button class="w3-button w3-white w3-border w3-border-red w3-round-xxlarge w3-hover-red w3-tiny">
										<a href="">java</a>
									</button>
								</div>
								<!-- 게시글 상/하단 나누는 div 끝 -->
							</td>
							<!-- 게시글 끝 -->

							<!-- 작성자 시작 -->
							<td class="qnaUser">
								<!-- 작성자 상/중/하단 나누는 div-->
								<div id="qnaUser_1"></div>
								<div id="qnaUser_2">
									<!-- 작성자 좌/우 나누는 div-->
									<div id="qnaUser_4"><i class="far fa-user-circle"></i></div>
									<div id="qnaUser_5">
										<!-- 작성자 닉네임 데이터값, 클릭 시 프로필로 이동 -->
										<a href="">남녀칠세부동산</a>
									</div>
									<!-- 작성자 좌/우 나누는 div 끝-->
								</div>
								<div id="qnaUser_3"><!-- SYSDATE -->2021-06-06 14:23</div>
								<!-- 작성자 상/중/하단 나누는 div 끝-->
							</td>
							<!-- 작성자 끝 -->
						</tr>
						<!-- 게시글 리스트 끝 -->

						<!-- 예시 리스트 -->
						<tr>
							<td class="qnaLike">
								<div id="qnaLike_1"></div>
								<div id="qnaLike_2">
									<div id="qnaLike_4"><i class="far fa-thumbs-up"></i></div>
									<div id="qnaLike_5"><!-- 좋아요 수 데이터 값-->X</div>
								</div>
								<div id="qnaLike_3">좋아요</div>
							</td>

							<td class="qnaReply">
								<div id="qnaReply_1"></div>
								<div id="qnaReply_2">
									<div id="qnaReply_4"><i class="far fa-comment-dots"></i></div>
									<div id="qnaReply_5"><!-- 답변 수 데이터값 -->X</div>
								</div>
								<div id="qnaReply_3">답변</div>
							</td>

							<td class="qnaView">
								<div id="qnaView_1"></div>
								<div id="qnaView_2">
									<div id="qnaView_4"><i class="far fa-eye"></i></div>
									<div id="qnaView_5"><!-- 조회수 수 데이터값 -->X</div>
								</div>
								<div id="qnaView_3">조회수</div>
							</td>

							<td class="qnaContent">
								<div id="qnaTitle">
									<a href=""><!-- 게시글 제목 -->X</a>
								</div>
								<div id="qnaTag">
									<button class="w3-button w3-white w3-border w3-border-red w3-round-xxlarge w3-hover-red w3-tiny">
										<a href=""><!-- 태그 이름 -->X</a>
									</button>
								</div>
							</td>

							<td class="qnaUser">
								<div id="qnaUser_1"></div>
								<div id="qnaUser_2">
									<div id="qnaUser_4"><i class="far fa-user-circle"></i></div>
									<div id="qnaUser_5">
										<a href=""><!-- 작성자 닉네임 -->X</a>
									</div>
								</div>
								<div id="qnaUser_3"><!-- SYSDATE -->X</div>
							</td>
						</tr>
					</table>
				</div>
				<!-- 게시글 리스트가 들어갈 부분 끝 -->

				<!-- 페이지네이션 -->
				<div class="w3-center">
					<a href="">&laquo;</a>
					<a class="active" href="">1</a>
					<a href="">2</a>
					<a href="">3</a>
					<a href="">4</a>
					<a href="">5</a>
					<a href="">&raquo;</a>
				</div>
				<!-- 페이지네이션 끝 -->
			</div>
			<!-- 게시판 중/하단 모두를 감싸는 div 끝 -->
		</div>
		<!-- 전체를 감싸는 div 끝-->

		<!-- 위로가기 아이콘 -->
		<a href="#header"><i class="fas fa-chevron-up" id="toTheTop">&nbsp;TOP</i></a>

	</div>
	<!-- innerOuter 끝 -->

	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>