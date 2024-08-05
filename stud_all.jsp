<html>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<body>
<h1>
<%
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tina","das");
		PreparedStatement ps=con.prepareStatement("select * from student");
		ResultSet rs=ps.executeQuery();
%>
	<h1>Student Details</h1>
	<table border="5" width="50%" bgcolor="pink">
	<tr bgcolor="red">
	<th>ROLL</th>
	<th>NAME</th>
	<th>STREAM</th>
	<th>MARKS</th>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
	<td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getFloat(4)%></td>
	</tr>
	<%
	}
	%>
	</table>
	<%	
	}
	catch(ClassNotFoundException e){}
	catch(SQLException e){}
%>
</h1>
</body>
</html>