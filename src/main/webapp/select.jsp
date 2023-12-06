<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section> 
<%@ include file="dbconn.jsp" %>  
<h1>직원정보 조회</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>성명</th>
    <th>사번</th>
    <th>직급</th>
    <th>직책</th>
    <th>연락처</th>
    <th>소속부서</th>
</tr>
<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select*from person0821";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String name = rs.getString("name");
    		 int id = rs.getInt("id");
    		 String position = rs.getString("position");
    		 String duty = rs.getString("duty");
    		 String dept = rs.getString("dept");
    		 String phone = rs.getString("phone");
    		 no++;
%>
<tr>
    <td><%=no %> </td>
    <td><%=name %> </td>
    <td><a href = "update.jsp?id=<%=id %>"><%=id %></a> </td>
    <td><%=position %> </td>
    <td><%=duty %> </td>
    <td><%=phone %> </td>
    <td><%=dept %> </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>
</table>

</section>
<%@ include file = "footer.jsp" %>
</body>
</html>