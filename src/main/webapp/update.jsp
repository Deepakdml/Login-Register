<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Update Student</h1>
	<%
	
	int studentId = Integer.parseInt(request.getParameter("id"));

	String name = request.getParameter("name");
	String course = request.getParameter("course");
	String email = request.getParameter("email");
	String mobile = request.getParameter("mobile");
	String password = request.getParameter("password");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
		String sql = "UPDATE log SET name=?, course=?, email=?, mobile=?, password=? WHERE id=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, name);
		pst.setString(2, course);
		pst.setString(3, email);
		pst.setString(4, mobile);
		pst.setString(5, password);
		pst.setInt(6, studentId);

		
		int rowsAffected = pst.executeUpdate();

		
		if (rowsAffected > 0) {
	%>
	<p>
		Student with Id
		<%=studentId%>
		has been updated.
	</p>
	<%
	} else {
	%>
	<p>
		Failed to update student with Id
		<%=studentId%>.
	</p>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	%>
	<p>An error occurred while updating the student.</p>
	<%
	}
	%>
	<a href="index.jsp">Back to Dashboard</a>
</body>
</html>