<html>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<body>
<%
  try {
    int rl = Integer.parseInt(request.getParameter("t1"));

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "tina", "das");
    PreparedStatement ps = con.prepareStatement("DELETE FROM student WHERE roll=?");

    ps.setInt(1, rl);
    int rowsDeleted = ps.executeUpdate();

    if (rowsDeleted > 0) {
        out.println("Record deleted successfully");
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
