<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
    <h1>Delete Student</h1>
    <%
        
         int id = Integer.parseInt(request.getParameter("id"));


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
            String sql = "DELETE FROM log WHERE name=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);

            
            int rowsAffected = pst.executeUpdate();

            
            if (rowsAffected > 0) {
    %>
    <p>Student with Id <%=id%> has been deleted.</p>
    <%
            } else {
    %>
    <p>Failed to delete student with ID <%=id%>.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <p>An error occurred while deleting the student.</p>
    <%
        }
    %>
    <a href="index.jsp">Back to Dashboard</a>
</body>
</html>