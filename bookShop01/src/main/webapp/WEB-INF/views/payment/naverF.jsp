<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>
<BODY>
	<H1>네이버카드/포인트실패</H1>	
	<!-- 낱개로 보낸경우 ${amount},  naverCardData통으로 보낸 경우는 ${naverCardData.amount} --> 
	<!-- 결과 뿌려주기 -->
	
	
	<table board=1>
	<c:if test="${naverCardData.type eq 'NAVER_MONEY'}">
		<tr>
			<td>승인일시:</td>
			<td><fmt:parseDate value="${naverData.authDateTime}" var="dateValue" pattern="yyyyMMddHHmmss"/>
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd HH:mm"/></td>					
		</tr>
		<!-- 위쪽 코드로 해야 날짜가 제대로 나온다. 
		<tr>
			<td>승인일시:</td>
			<td><fmt:formatDate value="${naverData.dateValue}" pattern="yyyy-MM-dd HH:mm"/></td>					
		</tr>
		//-->
		<tr>
			<td>결제된 총 금액:</td>		
			<td><fmt:formatNumber value="${naverData.amount}" pattern="#,###" /></td>
		</tr>
		<tr>
			<td>현금영수증 발급 대상 금액 :</td>
			<td> <fmt:formatNumber value="${naverData.cashReceipt}" pattern="#,###" /></td>
		</tr>	
	
	</c:if>
	<c:if test="${naverData.type eq 'NAVER_CARD' }">
		<tr>
			<td>승인일시</td>
			<td><fmt:formatNumber value="${naverData.authDateTime}" pattern="yyyy/MM/ddHHmmss" /></td>		
		</tr>
		<tr>
			<td>결제된 총 금액:</td>	
			<td><fmt:formatNumber value="${naverData.amount}" pattern="#,###" /></td>		
		</tr>
		<tr>
			<td>카드 승인 번호 :</td>	
			<td><c:out value="${naverData.authNumber}"/></td>
		</tr>
		<tr>	
			<td>카드 명 :</td>
			<td><c:out value="${naverData.cardName}"/></td>
		</tr>
		<tr>	
			<td>카드 번호 :</td>
			<td><c:out value="${naverData.cardNo}"/></td>
		</tr>
		<tr>	
			<td>할부 개월 :</td>
			<td><c:out value="${naverData.quota}"/></td>				
		</tr>		
	</c:if>
	</table>
	
</BODY>			
			
			