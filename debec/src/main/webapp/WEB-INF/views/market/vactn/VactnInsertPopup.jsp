<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
* 휴가를 등록하는 화면을 보여주는 JSP입니다.
* 
* history :
*        이인호, 1.0, 2016/08/17 – 초기 작성
* author : 이인호
* version : 1.0, 2016/08/17  - 초기 작성
* see : 관련된 모듈을 기술한다.
//-->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대신 장봐주는 남자 - 대.장.남</title>
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		
		<!-- 부가적인 테마 -->
		<link href="/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>

		<!-- JQuery 관련 파일들 -->
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>	
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body onbeforeunload="closeIt()">
		<div class="container">
			<form name="vactnReadInfo" id="vactnReadInfo" method="post">
			<div class="container" style="color: #fff; background-color: #000; border-radius:4px; padding:3px 8px;">
				<h3>휴가 등록</h3>
			</div>
			
			<div class="form-group"></div>
			
			<div class="container">
				<table class="table table-bordered form-inline">
					<tbody>
						<tr>
							<th class="active">
								<h5 class="text-center"><b>종류</b></h5>
							</th>
							<td>
								<select name="vactnType" class="form-control">
									<option value="휴가">휴가</option>
									<option value="연가">연가</option>
									<option value="병가">병가</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="active">
								<h5 class="text-center"><b>기간</b></h5>
							</th>
							<td>
								<input type="text" class="form-control" style="display: inline-block; width: 166px; vertical-align: middle;" name="schedlStartDat" id="schedlStartDat">
								<font> ~ </font>
								<input type="text" class="form-control" style="display: inline-block; width: 166px; vertical-align: middle;" name="schedlEndDat" id="schedlEndDat">
							 </td>
						</tr>
						<tr>
							<th class="active">
								<h5 class="text-center"><b>사유</b></h5>
							</th>
							<td><input type="text" class="form-control" name="schedlResn" id="schedlResn" placeholder="15자 이내로 작성해주세요"></td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			<div class="container text-center">
				<input class="btn btn-default"  type="button" value="등록"  onclick="javascript:vactnInsertForm()">
				<input class="btn btn-default"  type="button" value="취소" id="btn_cancel" onclick="javascript:cancel()">
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#btn_cancel').click(function() {
			         window.close();
			         window.opener.$("#FadeIn").remove();
				});
			});

			function closeIt(){
				self.close();
				window.opener.$("#FadeIn").remove();
			};
			
			function vactnInsertForm() {
				var formData = $("#vactnReadInfo").serialize();
				var today = new Date();
				var year = today.getFullYear();
				var month = today.getMonth() + 1;
				var day = today.getDate();
				
				var startDate = $( "input[name='schedlStartDat']" ).val();
				var startDateArr = startDate.split('-');
				       
				var endDate = $( "input[name='schedlEndDat']" ).val();
				var endDateArr = endDate.split('-');
				      
				var present = new Date(year, month, day);//오늘 날짜 
				var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]); //시작 날짜
				var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]); //종료 날짜
				if(startDate=="" || endDate == ""){
					alert("기간을 확인해 주십시오.");
			         return;
				}
				else if ($("#schedlResn").val().length >= 16) {
		         	   alert("사유를 15자리 이내로 작성하세요");
		        	    $("#schedlResn").focus();
		        	    return;
		        } 
				else {
			        if(startDateCompare.getTime() < present){
				         alert("기간을 확인해 주십시오.");
				         return;
			        }
			        else if(startDateCompare.getTime() > endDateCompare.getTime()){
				         alert("기간을 확인해 주십시오.");
				         return;
				    }
			        else if(endDateCompare.getTime() < present){
				         alert("기간을 확인해 주십시오.");
				         return;
				    }
			        else{
						$.ajax({
						   type : "POST",
						   url : "/vactnInsert.do",
						   data : formData,
						   success: function(msg) {
						   }
						});
			        }
				}
				self.close();
				window.opener.location.reload();
				window.opener.$("#FadeIn").remove();
			};

			// datepicker 위젯 
			// 날짜 선택 위젯, import 밑에 나와야됨
			$.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
		
		    $(function() {
		        $("#schedlStartDat").datepicker();
		        $("#schedlEndDat").datepicker();
		    }); 
		</script>
	</body>
</html>