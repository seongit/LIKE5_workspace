<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="aside-title">

        <h3 class="title">통합관리</h3>
        
        <div class="tab-area">
            <button class="btn btn-outline-danger active">후원내역</button>
            <button class="btn btn-outline-danger ">정산내역</button>
        </div>
    </div>

    <aside>
        <ul>
            <li>
                <a href="">회원관리</a>
            </li>
            <li>
                <a href="">게시글관리</a>
            </li>
            <li>
                <a  href="">고객센터</a>
            </li>
            <li>
                <a class="active" href="">후원관리</a>
            </li>
            <li>
                <a href="">공간대여관리</a>
            </li>
        </ul>
    </aside>

    <article>
        
        <div class="donationMem">
            <table id="memInfo">
                <tr>
                    <td width="500px"><h5><b style="text-align: left; font-size: 25px;">김망고</b>님의 후원 받은 내역</h5></td>
                    <td width="400px"><h5 style="text-align: center;">총 후원금 : <b style="color: rgb(220, 53, 69)  ;">140,000</b>원</h5> </td>
                </tr>
            </table>
        </div>

        <br>

        <table class="table-bordered table-sm">
            <thead>
                <tr class="table-danger">
                    <th width="50">No</th>
                    <th >후원한 회원명</th>
                    <th>후원한 회원의 닉네임</th>
                    <th>후원받은 금액</th>
                    <th>후원받은 날짜</th>
                    <th >정산받은 은행명</th>
                    <th width="180">정산받은 계좌</th>
                </tr>
            </thead>
            <!--반복문으로 뿌릴 때 제목을 클릭하면 해당 게시글로 넘어갈 수 있도록 해줘야해! 그럼 게시글 제목에 input-hidden으로 게시글 번호를 넣어줘야겠지 아마두-->
            <tbody>
                <tr>
                    <td>35</td>
                    <td>김아무개</td>
                    <td>rainbow</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >카카오뱅크</td>
                    <td >3393093830228</td>
                </tr>
                <tr>
                    <td>30</td>
                    <td>황민현</td>
                    <td>hyeon</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >농협</td>
                    <td >3393093830228</td>
                </tr>
                <tr>
                    <td>22</td>
                    <td>나유별</td>
                    <td>Imstar</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>19</td>
                    <td>지찬열</td>
                    <td>coldFire</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>이민혁</td>
                    <td>go5rae</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>35</td>
                    <td>김아무개</td>
                    <td>rainbow</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >카카오뱅크</td>
                    <td >3393093830228</td>
                </tr>
                <tr>
                    <td>30</td>
                    <td>황민현</td>
                    <td>hyeon</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >농협</td>
                    <td >3393093830228</td>
                </tr>
                <tr>
                    <td>22</td>
                    <td>나유별</td>
                    <td>Imstar</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>19</td>
                    <td>지찬열</td>
                    <td>coldFire</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>이민혁</td>
                    <td>go5rae</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>35</td>
                    <td>김아무개</td>
                    <td>rainbow</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >카카오뱅크</td>
                    <td >3393093830228</td>
                </tr>
                <tr>
                    <td>30</td>
                    <td>황민현</td>
                    <td>hyeon</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >농협</td>
                    <td >3393093830228</td>
                </tr>
                <tr>
                    <td>22</td>
                    <td>나유별</td>
                    <td>Imstar</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>19</td>
                    <td>지찬열</td>
                    <td>coldFire</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
                <tr>
                    <td>10</td>
                    <td>이민혁</td>
                    <td>go5rae</td>
                    <td><a>1,000원</a></td>
                    <td>2021-05-14</td>
                    <td >국민</td>
                    <td >2143093830228</td>
                </tr>
            </tbody>
        </table>

    
    </article>

    <br><br>
    
    <!-- 페이징 바 -->
    <div class="paging-area">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
        </ul>
    </div>

    <br><br>
</body>
</html>