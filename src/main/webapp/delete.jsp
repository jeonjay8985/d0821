<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.name.value=="") {
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.id.value=="") {
		alert("사원번호를 입력하세요");
		document.frm.id.focus();
		return false;
	}
	document.frm.submit();
}
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section>   
<h1>사원정보 삭제하기</h1>

<form name="frm" method="post" action="deleteProcess.jsp">
<table border=1 id="tab3">
<tr>
  <th>성명 </th>
  <td><input type="text" name="name" id=in> </td>
</tr>

<tr>
  <th>사원번호 </th>
  <td><input type="text" name="id" id=in> </td>
</tr>

<tr>
  <td colspan=2 align="center"> 

  <input type="button" id="bt1" value="삭제" onclick="check()">
  <input type="reset" id="bt1" value="취소">
  </td>
</tr>


</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>