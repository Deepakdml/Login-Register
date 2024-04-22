<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
    <h1>Edit Student</h1>
    <%
        
    int id = Integer.parseInt(request.getParameter("id"));


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
            String sql = "SELECT * FROM log WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            
            if (rs.next()) {
                
                id = rs.getInt("id");
                String name = rs.getString("name");
                String course = rs.getString("course");
                String email = rs.getString("email");
                String mobile = rs.getString("mobile");
                String password = rs.getString("password");
    %>
    <form action="update.jsp" method="post">
       
        <input type="hidden" name="id" value="<%=id%>">
        
        Name: <input type="text" name="name" value="<%=name%>"><br>
        Course: <input type="text" name="course" value="<%=course%>"><br>
        Email: <input type="text" name="email" value="<%=email%>"><br>
        Mobile: <input type="text" name="mobile" value="<%=mobile%>"><br>
        Password: <input type="text" name="password" value="<%=password%>"><br>
        <input type="submit" value="Update">
    </form>
    <% } else { %>
    <p>Student not found.</p>
    <% }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>

</body>
</html>