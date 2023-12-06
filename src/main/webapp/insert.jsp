<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	if(document.frm.id.value==""){
		alert("사번을 입력하세요");
		document.frm.id.focus(); //커서가 id에 그대로 남아있도록 
		return false;            //사번을 입력하지 않으면 진행불가
	}
	if(document.frm.name.value==""){
		alert("이름을 입력하세요");
		document.frm.name.focus(); //커서가 name에 그대로 남아있도록
		return false;  
	}
	if(document.frm.duty.value==""){
		alert("직책을 입력하세요");
		document.frm.duty.focus(); //커서가 duty에 그대로 남아있도록
		return false;  
	}
	if(document.frm.phone.value==""){
		alert("연락처를 입력하세요");
		document.frm.phone.focus(); //커서가 phone에 그대로 남아있도록
		return false;  
	}
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>사원 등록하기</h1>
<form name="frm" method="post" action="insertProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>사원번호</th>
      <td><input type="text" name="id" id=in></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in></td>
</tr>

<tr> 
      <th>소속부서</th>
    <td>
      <select name = "dept" id=in1>
      <option value ="인사부" selected>인사부</option>
      <option value ="기획부"> 기획부</option>
      <option value ="영업부"> 영업부</option>
      <option value ="경리부"> 경리부</option>
      </select>
    </td>
</tr>

<tr> 
      <th>직급</th>
    <td>
      <select name = "position" id=in1>
      <option value ="1" selected>1급</option>
      <option value ="2"> 2급</option>
      <option value ="3"> 3급</option>
      <option value ="4"> 4급</option>
      </select>
    </td>
</tr>

<tr> 
      <th>직책</th>
      <td><input type="text" name="duty" id=in></td>
</tr>
    
<tr> 
      <th>연락처</th>
      <td><input type="text" name="phone" id=in></td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>