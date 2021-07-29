<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- memProfile.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memProfile.css" />

</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" />

	<!-- [한솔] 회원 프로필 조회 페이지  -->
	<div class="innerOuter">
		<!-- 전체를 감싸는 div -->
		<div class="profileMain">
			<!-- 페이지 상단 회원 정보 영역 -->
			<div class="profileTop">
				<table class="memberInfo">
					<tr><td colspan="6"></td></tr>
					<tr>
						<td rowspan="2" class="memPhoto"><i class="far fa-user-circle"></i></td>
						<td rowspan="2" class="blank1">&nbsp;</td>
						<td colspan="4" class="memName">라이언고슬밥</td>
					</tr>
					<tr>
						<td class="memWriteNo">총 게시글 <!--총 개시글 개수 데이터값 -->11개</td>
						<td class="blank1">|</td>
						<td class="memReplyNo">총 댓글 <!--총 댓글 개수 데이터값 -->9개</td>
						<td class="blank2">&nbsp;</td>
					</tr>
					<tr><td colspan="6"></td></tr>
				</table>
			</div>
			<!-- 페이지 상단 회원 정보 영역 끝 -->

			<!-- 페이지 하단 전체 영역 -->
			<div class="profileBottom">
				<!-- 글/댓글/스크랩 카테고리 선택 영역 -->
				<div class="pickCategory">
					<div class="myContent"><a href="">작성 글</a></div>
					<div class="myReply"><a href="">작성 댓글</a></div>
					<div class="myScrap"><a href="">스크랩한 게시글</a></div>
					<div class="myNull">&nbsp;</div>
				</div>
				<!-- 글/댓글/스크랩 카테고리 선택 영역 끝 -->

				<!-- 글/댓글/스크랩 내역 영역 -->
				<div class="listInfo">
					<table class="w3-table w3-bordered w3-centered">
						<thead>
							<tr class="w3-red">
								<th class="nullCell"></th>
								<th class="checkIt">선택</th>
								<th class="contentNo">번호</th>
								<th class="contentTitle">제목</th>
								<th class="contentDate">작성일</th>
								<th class="nullCell"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td><input type="checkbox"></td>
								<td><!--글 or 댓글번호-->2</td>
								<td><!-- 글 or 댓글이 달린 글 제목 -->올해 운전연수 받을거에요</td>
								<td><!-- 해당 글 작성일 -->2021-07-29</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="checkbox"></td>
								<td><!--글 or 댓글번호-->1</td>
								<td><!-- 글 or 댓글이 달린 글 제목 -->베스트 드라이버 바로 나야 나</td>
								<td><!-- 해당 글 작성일 -->2021-07-27</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 글/댓글/스크랩 내역 영역 -->

				<!-- 전체선택, 삭제하기 영역 -->
				<div class="listCheck">
					<div class="checkAll"><input type="checkbox">&nbsp;&nbsp;전체선택</div>
					<div class="deleteButton">
						<button type="submit" class="btn btn-danger"><a href="">삭제하기</a></button>
					</div>
				</div>
				<!-- 전체선택, 삭제하기 영역 끝 -->

				<!-- 페이지네이션 영역  -->
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
			<!-- 페이지 하단 전체 영역 끝 -->
		</div>
		<!-- 전체를 감싸는 div -->
	</div>
	<!--페이지 영역 끝 -->


	<!-- JS -->
	<script>
		// 넣을 스크립트 : 전체선택, 전체해제, 일부 선택 후 삭제
	</script>

	<!-- 푸터바 -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>