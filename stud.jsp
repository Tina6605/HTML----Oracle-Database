<html>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<body>
<%
  try{
int rl=Integer.parseInt(request.getParameter("t1"));
String nm=(request.getParameter("t2"));
String st=(request.getParameter("t3"));
float mk=Float.parseFloat(request.getParameter("t4"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tina","das");
PreparedStatement ps=con.prepareStatement("insert into student valueS(?,?,?,?)");
ps.setInt(1,rl);
ps.setString(2,nm);
ps.setString(3,st);
ps.setFloat(4,mk);
ps.executeUpdate();
con.close();
out.println("record successfully registered");
}
catch(ClassNotFoundException e){}
catch(SQLException e){}
%>
</body>
</html>