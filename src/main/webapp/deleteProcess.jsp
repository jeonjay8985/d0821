<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file = "dbconn.jsp" %>
<%
   String id = request.getParameter("id");
   String name = request.getParameter("name");
   ResultSet rs = null;
   PreparedStatement pstmt = null;
   try{
	   String sql = "select name from person0821 where id=?"; //테이블 읽기
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs=pstmt.executeQuery();
	   if(rs.next()) {
		   String NAME = rs.getString(1); //select name<-폼에서 넘어온 name 가져와서 데.베 NAME으로 지정
		   if(name.equals(NAME)) {        //form name, table NAME 
			   sql = "delete from person0821 where id=?";
		       pstmt = conn.prepareStatement(sql);
		       pstmt.setString(1 , id);
		       pstmt.executeUpdate();
		       %> 
		       <script>                   //%> jsp 열기
		        alert("삭제 성공");
		        location.href="select.jsp";
		       </script>
		       <%
		   }else {	   
		   %>
		   <script>
		   alert("일치하지 않은 이름입니다");
		   history.back(-1); //등록되지 않은 사번이면 다시 사원정보 삭제하기로 되돌아가는 역할
		   </script>
		   <%
		   }
		   
	   }else {
		   %>
		   <script>
		   alert("등록되지 않은 사번입니다");
		   history.back(-1); //등록되지 않은 사번이면 다시 사원정보 삭제하기로 되돌아가는 역할
		   </script>
		   <%
	   }
   }catch(Exception e) {
	   System.out.println("읽기 에러 : " +e.getMessage());
	   
   }
%>
</body>
</html>