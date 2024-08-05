<html>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<body>
<%
  try {
    int rl = Integer.parseInt(request.getParameter("t1"));
    String nm = request.getParameter("t2");
    float mk = Float.parseFloat(request.getParameter("t4"));

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tina", "das");
    PreparedStatement ps = con.prepareStatement("UPDATE student SET sname=?, marks=? WHERE roll=?");
    ps.setString(1, nm);
    ps.setFloat(2, mk);
    ps.setInt(3, rl);
    int rowsUpdated = ps.executeUpdate();

    if (rowsUpdated > 0) {
        out.println("Record updated successfully");
    } else {
        out.println("Record not found");
    }
    con.close();
  } catch (ClassNotFoundException e) {
    out.println("Driver not found: " + e.getMessage());
  } catch (SQLException e) {
    out.println("SQL error: " + e.getMessage());
  } catch (NumberFormatException e) {
    out.println("Invalid input: " + e.getMessage());
  }
%>
</body>
</html>
