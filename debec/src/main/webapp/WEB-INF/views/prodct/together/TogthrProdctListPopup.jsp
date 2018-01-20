<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!-- 
* 패키지 목록을 조회하는 화면을 보여주는 JSP입니다.
* 
* history :0.
*        김동욱, 1.0, 2016/08/13 – 초기 작성
* author : 김동욱
* version : 1.1, 2016/08/18 - 초기 작성
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
	
	<!-- 이미지 썸네일 CSS -->
	<link href="/resources/common/css/thumbnail.css" rel="stylesheet" type="text/css"/>
	
	<!-- JQuery 관련 파일들 -->
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>   
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
<!-- 	<script src="/resources/js/display-js/jquery.tablednd.js"></script> -->
	
<!-- 	<!-- JSTree 관련 JS --> -->
	<script src="/resources/js/jstree/jstree.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="/resources/js/jstree/themes/proton/style.min.css">
	
	<script src="/resources/js/display-js/togthr.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!-- 	<form name="prodctPagingFrm" id="prodctPagingFrm" method="post">       -->
<%-- 		<input type="hidden" name="prodctSechText" value="${MainDisplayValueObject2.prodctSechText}"> <!-- 검색 상품명 --> --%>
<%-- 		<input type="hidden" name="currentPageNo" value="${MainDisplayValueObject2.currentPageNo}"> <!-- 현재 페이지 --> --%>
<!-- 		<input type="hidden" name="prodctSeq" id="prodctSeq"> 상품seq -->
<!-- 	</form> -->
	<div class="container" style="color: #fff; background-color: #000; border-radius:4px; padding:3px 8px;">
		<h3>다함께 상품 등록</h3>
	</div>
		
	<div class="form-group"></div>
	
	<div class="container">
		<div class="pull-left" style="display:inline-block;">
			<table class="table table-bordered" style="width:270px;">
				<tr>
					<th class="active">카테고리</th>
				</tr>
				<tr>
				<!-- td에 height값을 줘야 JSTree가 고정됨 -->
				<td style="height:500px; vertical-align: top;"><div id="tree" style="max-height:100%; overflow:auto"></div></td>
				</tr>
			</table>
		</div>
		
		<div id="togthProdctManagementList"class="pull-left" style="margin-left:10px; display:inline-block; width:380px;">
			<c:import url="/togthrProdctAdList.do"/>	
		</div>
      	
      	<div class="pull-left" style="margin-left:10px; display:inline-block; width:380px;">
			<c:import url="/togthrInsert.do"/>
		</div>
	</div>
	
	<div class="container text-right">
		<input type="button" class="btn btn-default" value="등록" style="width:150px;" id="togthrProdctInsert">
		<input type="button" class="btn btn-default" value="취소" style="width:150px;" id="togthrProdctCancle">
	</div>
</body>
</html>