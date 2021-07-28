<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- qnaDetailView.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaDetailView.css" />
	
</head>

<body>
	<!-- 메뉴바 -->
	<jsp:include page="../../common/header.jsp" />

	<!-- [한솔] QnA 게시글 상세 페이지 -->
	<div class="innerOuter">
		<!-- 전체를 감싸는 div -->
		<div class="qnaMain">
			<!-- 페이지 상단 이름/질문하기 버튼 영역 -->
			<div class="qnaTop">
				<div class="qnaTop1"><h2><b>QnA</b></h2></div>
				<div class="qnaTop2">
					<button type="button" class="btn btn-danger"><a href="qEnrollForm.bo">질문하기</a></button>
				</div>
			</div>
			<!-- 페이지 상단 이름/질문하기 버튼 영역 끝 -->

			<!-- 페이지 중단 게시글 디테일 영역 -->
			<div class="qnaMiddle">
				<!-- 게시글 정보 영역 -->
				<div class="qnaInfo">
					<table>
						<tr class="qnaInfo1">
							<td class="tableBlank" rowspan="2"></td>
							<td class="qnaTitle"><!-- 게시글 제목 -->제목 테스트</td>
							<td class="qnaLike1"><i class="far fa-thumbs-up"></i></td>
							<td class="qnaLike2"><!--좋아요 수 데이터 값 -->100</td>
							<td class="qnaReply1"><i class="far fa-comment-dots"></i></td>
							<td class="qnaReply2"><!--답변 수 데이터 값 -->100</td>
							<td class="qnaView1"><i class="far fa-eye"></i></td>
							<td class="qnaView2"><!--조회수 데이터 값 -->100</td>
							<td class="tableBlank" rowspan="2"></td>
						</tr>
						<tr class="qnaInfo2">
							<td class="qnaTag">
								<!-- 태그 -->
								<button class="w3-button w3-white w3-border w3-border-red w3-round-xxlarge w3-hover-red w3-tiny">
									<a href="">java</a>
								</button>
							</td>
							<td class="qnaUser1"><i class="far fa-user-circle"></i></td>
							<td class="qnaUser2" colspan="3"><!-- 작성자 닉네임(한글 기준 8자까지) -->게시글작성자</td>
							<td class="qnaUser3" colspan="2"><!-- SYSDATE -->2021-06-06</td>
						</tr>
					</table>
				</div>
				<!-- 게시글 정보 영역 끝 -->

				<!-- 게시글 상세 영역 -->
				<div class="qnaDetail">
					<!-- 좌측 게시글 본문 -->
					<div class="qnaContent">
						<div class="contentData">
							<!-- 본문 내용 데이터값 -->본문 내용 데이터 일치시켜서 가져오기
						</div>
					</div>
					<!-- 좌측 게시글 본문 끝 -->

					<!-- 우측 아이콘 옵션 -->
					<div class="qnaIcon">
						<!-- 글 작성자와 로그인한 회원이 불일치할 경우 -->
						<table>
							<tr><td></td></tr>
							<tr>
								<td class="icon"><i class="far fa-thumbs-up" id="like"></i>
									<i class="fas fa-thumbs-up" id="selected-like" style="display: none; color: rgb(220, 53, 69);"></i>
								</td>
							</tr>
							<tr><td class="iconName">좋아요</td></tr>
							<tr>
								<td class="icon"><i class="far fa-bookmark" id="scrap"></i>
									<i class="fas fa-bookmark" id="selected-scrap" style="display: none; color: rgb(220, 53, 69);"></i>
								</td>
							</tr>
							<tr><td class="iconName">스크랩</td></tr>
							<tr>
								<td class="icon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
							</tr>
							<tr><td class="iconName">신고하기</td></tr>
							<tr><td class="icon"><i class="fas fa-share-alt"></i></td></tr>
							<!-- 서버 연동할 경우 그 후에 작업 (로컬로 url 파싱 불가) -->
							<tr><td class="iconName">URL 공유</td></tr>
							<tr><td></td></tr>
						</table>

						<!-- 글 작성자와 로그인한 회원이 일치할 경우
			            <table>
			              <tr><td></td></tr>
			              <tr><td class="icon"><i class="fas fa-sync-alt"></i></td></tr>
			              <tr><td class="iconName">수정하기</td></tr>
			              <tr><td class="icon"><i class="fas fa-share-alt"></i></td></tr>
			              <tr><td class="iconName">URL 공유</td></tr>
			              <tr><td class="icon"><i class="far fa-trash-alt"></i></td></tr>
			              <tr><td class="iconName">삭제하기</td></tr>
			              <tr><td></td></tr>
			            </table> -->
					</div>
					<!-- 우측 아이콘 옵션 끝 -->
				</div>
				<!-- 게시글 상세 영역 끝 -->
			</div>
			<!-- 페이지 중단 게시글 디테일 영역 끝 -->

			<!-- 페이지 하단 댓글 디테일 영역 -->
			<div class="qnaBottom">
				<!-- 답변 갯수 안내 -->
				<div class="replyGuide"><b><!-- 게시글 답변 개수 -->N개의 답변</b></div>

				<!-- 원댓글 영역 -->
				<div class="replyLv1">
					<!-- 답변자 정보 영역 -->
					<!-- 채택된 답변일 경우, 내가 작성한 댓글일 경우 → .replyInfo 배경색 변경 -->
					<div class="replyInfo">
						<table>
							<tr class="replyInfo1">
								<td class="tableBlank" rowspan="2"></td>
								<td class="replyUser1" rowspan="2"><i class="far fa-user-circle"></i></td>
								<td class="replyUser2">답변작성자A</td>
								<td class="replyAdoption" rowspan="2">
									<!-- 글 작성자와 로그인한 회원이 일치할 경우 보여지는 버튼 -->
									<button type="button" class="btn text-muted btn-lg">
										<i class="far fa-check-square text-muted"></i>&nbsp;&nbsp;&nbsp;채택하기
									</button>
								</td>
								<td class="reReply" rowspan="2">
									<button type="button" class="btn text-muted btn-lg">
										<i class="far fa-plus-square text-muted"></i>&nbsp;&nbsp;&nbsp;대댓글 달기
									</button>
								</td>
								<td class="tableBlank" rowspan="2"></td>
							</tr>
							<tr class="replyInfo2">
								<td class="replyUser3">2021-06-06</td>
							</tr>
						</table>
					</div>
					<!-- 답변자 정보 영역 끝 -->

					<!-- 답변 상세 영역 -->
					<div class="replyDetail">
						<!-- 좌측 답변 본문 -->
						<div class="replyContent">
							<div class="replyContentData">
								<!-- 답변 내용 데이터값 -->답변 내용 데이터 일치시켜서 가져오기
							</div>
						</div>
						<!-- 좌측 답변 본문 끝 -->

						<!-- 우측 아이콘 옵션 -->
						<div class="replyIcon">
							<!-- 답변 작성자와 로그인한 회원이 불일치할 경우 -->
							<table>
								<tr><td></td></tr>
								<tr><td class="rIcon"><i class="fas fa-angle-up"></i></td></tr>
								<tr><td class="rLikeNum"><!-- 답변 좋아요 데이터값 --> 0</td></tr>
								<tr><td class="rIcon"><i class="fas fa-angle-down"></i></td></tr>
								<tr><td class="rIconName">좋아요</td></tr>
								<tr>
									<td class="rIcon"><i class="far fa-heart" data-toggle="modal" data-target="#sponsorship-modal"></i></td>
								</tr>
								<tr><td class="rIconName">후원하기</td></tr>
								<tr>
									<td class="rIcon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
								</tr>
								<tr><td class="rIconName">신고하기</td></tr>
								<tr><td></td></tr>
							</table>

							<!-- 답변 작성자와 로그인한 회원이 일치할 경우
			                <table>
			                <tr><td></td></tr>
			                <tr><td class="rIcon"><i class="fas fa-angle-up"></i></td></tr>
			                <tr><td class="rLikeNum">답변 좋아요 데이터값</td></tr>
			                <tr><td class="rIcon"><i class="fas fa-angle-down"></i></td></tr>
			                <tr><td class="rIconName">좋아요</td></tr>
			                <tr><td class="rIcon"><i class="far fa-trash-alt"></i></td></tr>
			                <tr><td class="rIconName">삭제하기</td></tr>
			                </table> -->
						</div>
						<!-- 우측 아이콘 옵션 끝 -->
					</div>
					<!-- 답변 상세 영역 끝 -->
				</div>
				<!-- 원댓글 영역 끝 -->

				<!-- 대댓글 영역 -->
				<div class="replyLv2">
					<!-- 답변자 정보 영역 -->
					<div class="replyInfo">
						<table>
							<tr class="replyInfo1">
								<td class="tableBlank" rowspan="2"></td>
								<td class="replyUser1" rowspan="2"><i class="far fa-user-circle"></i></td>
								<td class="replyUser2">답변작성자B</td>
							</tr>
							<tr class="replyInfo2">
								<td class="replyUser3">2021-06-06</td>
							</tr>
						</table>
					</div>
					<!-- 답변자 정보 영역 끝 -->

					<!-- 답변 상세 영역 -->
					<div class="replyDetail">
						<!-- 좌측 답변 본문 -->
						<div class="replyContent">
							<div class="replyContentData">
								<!-- 답변 내용 데이터값 -->답변 내용 데이터 일치시켜서 가져오기
							</div>
						</div>
						<!-- 좌측 답변 본문 끝 -->

						<!-- 우측 아이콘 옵션 -->
						<div class="replyIcon">
							<!-- 답변 작성자와 로그인 한 회원이 불일치할 경우 -->
							<table>
								<tr><td></td></tr>
								<tr><td class="rIcon"><i class="fas fa-angle-up"></i></td></tr>
								<tr><td class="rLikeNum"><!-- 답변 좋아요 데이터값 --> 0</td></tr>
								<tr><td class="rIcon"><i class="fas fa-angle-down"></i></td></tr>
								<tr><td class="rIconName">좋아요</td></tr>
								<tr>
									<td class="rIcon"><i class="far fa-heart" data-toggle="modal" data-target="#sponsorship-modal"></i></td>
								</tr>
								<tr><td class="rIconName">후원하기</td></tr>
								<tr>
									<td class="rIcon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
								</tr>
								<tr><td class="rIconName">신고하기</td></tr>
								<tr><td></td></tr>
							</table>

							<!-- 답변 작성자와 로그인 한 회원이 일치할 경우
			                <table>
			                <tr><td></td></tr>
			                <tr><td class="rIcon"><i class="fas fa-angle-up"></i></td></tr>
			                <tr><td class="rLikeNum">답변 좋아요 데이터 값</td></tr>
			                <tr><td class="rIcon"><i class="fas fa-angle-down"></i></td></tr>
			                <tr><td class="rIconName">좋아요</td></tr>
			                <tr><td class="rIcon"><i class="far fa-trash-alt"></i></td></tr>
			                <tr><td class="rIconName">삭제하기</td></tr>
			                </table> -->
						</div>
						<!-- 우측 아이콘 옵션 끝 -->
					</div>
					<!-- 답변 상세 영역 끝 -->
				</div>
				<!-- 대댓글 영역 끝-->

				<!-- 구현용 예시 댓글 시작 -->
				<div class="replyLv1">
					<div class="replyInfo">
						<table>
							<tr class="replyInfo1">
								<td class="tableBlank" rowspan="2"></td>
								<td class="replyUser1" rowspan="2"><i class="far fa-user-circle"></i></td>
								<td class="replyUser2">답변작성자C</td>
								<td class="replyAdoption" rowspan="2">
									<!-- 글 작성자와 로그인한 회원이 일치할 경우 보여지는 버튼 -->
									<button type="button" class="btn text-muted btn-lg">
										<i class="far fa-check-square text-muted"></i>&nbsp;&nbsp;&nbsp;채택하기
									</button>
								</td>
								<td class="reReply" rowspan="2">
									<button type="button" class="btn text-muted btn-lg">
										<i class="far fa-plus-square text-muted"></i>&nbsp;&nbsp;&nbsp;대댓글 달기
									</button>
								</td>
								<td class="tableBlank" rowspan="2"></td>
							</tr>
							<tr class="replyInfo2"><td class="replyUser3">2021-06-06</td></tr>
						</table>
					</div>
					<div class="replyDetail">
						<div class="replyContent">
							<div class="replyContentData">답변 내용 데이터 일치시켜서 가져오기</div>
						</div>
						<div class="replyIcon">
							<table>
								<tr><td></td></tr>
								<tr><td class="rIcon"><i class="fas fa-angle-up"></i></td></tr>
								<tr><td class="rLikeNum"><!-- 답변 좋아요 데이터값 --> 0</td></tr>
								<tr><td class="rIcon"><i class="fas fa-angle-down"></i></td></tr>
								<tr><td class="rIconName">좋아요</td></tr>
								<tr>
									<td class="rIcon"><i class="far fa-heart" data-toggle="modal" data-target="#sponsorship-modal"></i></td>
								</tr>
								<tr><td class="rIconName">후원하기</td></tr>
								<tr>
									<td class="rIcon"><i class="far fa-thumbs-down" data-toggle="modal" data-target="#report-modal"></i></td>
								</tr>
								<tr><td class="rIconName">신고하기</td></tr>
								<tr><td></td></tr>
							</table>
						</div>
					</div>
				</div>
				<!-- 구현용 예시 댓글 끝 -->
			</div>
			<!-- 페이지 하단 댓글 디테일 영역 끝 -->

			<!-- 답변을 작성할 수 있는 영역(항상 보여짐) -->
			<div class="writeReply">
				<!-- 답변 작성 안내 -->
				<div class="replyGuide">
					<div class="replyGuide1"><b>답변 달기</b></div>
					<div class="replyGuide2">⭐ 답변 작성 시 유의사항 안내 
						<span class="tooltiptext">
							LIKE5의 질문에 답변해주셔서 감사합니다 👍<br>
							답변을 달기 전, 아래의 유의사항을 확인해주세요!<br><br>
							＊ 질문과 관련된 답변인지 확인해주세요<br>
							＊ 답변이 정확한 정보인지 확인해주세요<br>
							＊ 답변이 등록되면 수정이 불가능해요<br>
							＊ 내용에 오·탈자가 없는지 확인해주세요
						</span>
					</div>
					<div class="replyGuide3"></div>
				</div>
				<!-- 답변 작성 안내 끝 -->

				<!-- 로그인한 회원 정보 영역 -->
				<div class="userInfo">
					<table>
						<tr class="loginUserInfo">
							<td class="tableBlank"></td>
							<td class="userInfo1"><i class="far fa-user-circle"></i></td>
							<td class="userInfo2">로그인한회원</td>
						</tr>
					</table>
				</div>
				<!-- 답변자 정보 영역 끝 -->

				<!-- 답변 상세 영역 -->
				<div class="userWrite1">
					<!-- 마크다운 API가 들어올 자리 -->
					<div>
						마크다운 API 들어올 div 공간 <br><br>
						비율 맞추려고 padding:1% 로 설정해뒀어요 ꔷ̑◡ꔷ̑<br>
						구현 시에 padding값 지워야하면 말씀해주세요!
					</div>
					<!-- 마크다운 API가 들어올 자리 끝-->
				</div>
				<!-- 답변 상세 영역 끝  -->

				<!-- 답변달기 관련 하단부 -->
				<div class="userWrite2">
					<button type="button" class="btn btn-danger">
						<a href="">답변달기</a>
					</button>
				</div>
				<!-- 답변달기 버튼 끝 -->
			</div>
			<!-- 답변달기 관련 하단부 끝 -->
		</div>
		<!-- 답변을 작성할 수 있는 영역(항상 보여짐) 끝 -->


		<!-- 신고하기 모달창 -->
		<div class="modal fade" id="report-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<!-- 모달 전체 div -->
				<div class="modal-content">

					<!-- 신고하기 모달 헤더 -->
					<div class="modal-header">
						<h5 class="modal-title">🚨 <b>신고하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- 신고하기 모달 바디 -->
					<div class="modal-body">
						<div class="report-user"><b>작성자 : </b> 글/댓글 작성자 닉네임</div>
						<div class="modal-choice">
							<table>
								<tr>
									<td style="font-size: 14px; padding-right: 10px;"><b>사유선택 :</b></td>
									<td rowspan="2" style="font-size: 13px; padding-bottom: 18px;">
										&nbsp;여러 사유에 해당되는 경우,<br>&nbsp;대표 사유를 선택해주세요.
									</td>
								</tr>
								<tr><td rowspan="5"></td></tr>
								<tr>
									<td><input type="radio" id="f-option" name="selector">
										<label for="f-option">부적절한 홍보 게시글</label></td>
								</tr>
								<tr>
									<td><input type="radio" id="s-option" name="selector">
										<label for="s-option">욕설,비방 음란성등</label></td>
								</tr>
								<tr>
									<td><input type="radio" id="t-option" name="selector">
										<label for="t-option">명예훼손, 사생활 침해</label></td>
								</tr>
								<tr>
									<td><input type="radio" id="o-option" name="selector">
										<label for="o-option">기타</label></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- 신고하기 모달 바디 끝 -->

					<!-- 신고하기 모달 푸터 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">신고하기</button>
						<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">취소</button>
					</div>
					<!-- 신고하기 모달 푸터 끝-->
				</div>
				<!-- 모달 전체 div 끝 -->
			</div>
		</div>
		<!-- 신고하기 모달창 끝 -->


		<!-- 후원하기 모달창 -->
		<div class="modal fade" id="sponsorship-modal">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<!-- 모달 전체 div -->
				<div class="modal-content">

					<!-- 후원하기 모달 헤더 -->
					<div class="modal-header">
						<h5 class="modal-title">💌 <b>후원하기</b></h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- 후원하기 모달 바디 -->
					<div class="modal-body" style="text-align: center;">
						<br>답변이 마음에 드셨다면<br>해당 작성자에게 후원할 수 있습니다.<br>후원하시겠어요?
						<br><br>
						<p style="font-size: 9px;">(OK 버튼 클릭 시 결제창으로 이동합니다.)</p>
					</div>

					<!-- 후원하기 모달 푸터 -->
					<div class="modal-footer" style="justify-content: center;">
						<button type="submit" class="btn btn-danger btn-block">OK</button>
					</div>
				</div>
				<!-- 모달 전체 div 끝-->
			</div>
		</div>
		<!-- 후원하기 모달창 끝 -->

	</div>
	<!-- 전체를 감싸는 div 끝 -->


	<!-- 위로가기 아이콘 -->
	<a href="#header"><i class="fas fa-chevron-up" id="toTheTop">&nbsp;TOP</i></a>


	<!-- JS -->
	<script>
		//좋아요 아이콘 클릭 시 아이콘 변경
		$('[class$=fa-thumbs-up]').click(function() {
			if ($('#selected-like').css('display') == 'none') {
				$('#selected-like').css('display', '');
				$('#like').css('display', 'none');
			} else {
				$('#selected-like').css('display', 'none');
				$('#like').css('display', '');
			}
		})

		//스크랩 아이콘 클릭 시 아이콘 변경
		$('[class$=fa-bookmark]').click(function() {
			if ($('#selected-scrap').css('display') == 'none') {
				$('#selected-scrap').css('display', '');
				$('#scrap').css('display', 'none');
			} else {
				$('#selected-scrap').css('display', 'none');
				$('#scrap').css('display', '');
			}
		})
	</script>
	
	<!-- 푸터바 -->
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>