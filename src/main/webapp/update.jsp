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
		document.frm.id.focus(); 
		return false;            
	}
	if(document.frm.name.value==""){
		alert("이름을 입력하세요");
		document.frm.name.focus(); 
		return false;  
	}
	if(document.frm.duty.value==""){
		alert("직책을 입력하세요");
		document.frm.duty.focus(); 
		return false;  
	}
	if(document.frm.phone.value==""){
		alert("연락처를 입력하세요");
		document.frm.phone.focus(); 
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
<h1>사원정보 변경하기</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String id = request.getParameter("id"); //update.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from person0821 where id=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String name = rs.getString("name");
		   String dept = rs.getString("dept");
		   String position = rs.getString("position");
		   String duty = rs.getString("duty");
		   String phone = rs.getString("phone"); 
		   
%>
<form name="frm" method="post" action="updateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>사원번호</th>
      <td><input type="text" name="id" id=in value="<%=id%>"></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in value="<%=name%>"></td>
</tr>

<tr> 
      <th>소속부서</th>
    <td>
      <select name = "dept" id=in1>
      <option value ="인사부" <% if(dept.equals("인사부")){ %>selected <%}%>> 인사부</option> 
      <option value ="기획부" <% if(dept.equals("기획부")){ %>selected <%}%>> 기획부</option>
      <option value ="영업부" <% if(dept.equals("영업부")){ %>selected <%}%>> 영업부</option>
      <option value ="경리부" <% if(dept.equals("경리부")){ %>selected <%}%>> 경리부</option>
      <option value ="홍보부" <% if(dept.equals("홍보부")){ %>selected <%}%>> 홍보부</option>
      </select>
    </td>
</tr>

<tr> 
      <th>직급</th>
    <td>
      <select name = "position" id=in1>
      <option value ="1" <% if(position.equals("1")) { %>selected <%}%>> 1급</option>
      <option value ="2" <% if(position.equals("2")) { %>selected <%}%>> 2급</option>
      <option value ="3" <% if(position.equals("3")) { %>selected <%}%>> 3급</option>
      <option value ="4" <% if(position.equals("4")) { %>selected <%}%>> 4급</option>
      </select>
    </td>
</tr>

<tr> 
      <th>직책</th>
      <td><input type="text" name="duty" id=in value="<%=duty%>"></td>
</tr>
    
<tr> 
      <th>연락처</th>
      <td><input type="text" name="phone" id=in value="<%=phone%>"></td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("인사정보 읽기 에러" +e.getMessage());
   }
%>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>