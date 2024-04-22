<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*, java.sql.*,jakarta.servlet.http.HttpServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RK Dashboard</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #913ae8;
        margin: 0;
        padding: 0;
    }

    .main-content {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

</style>


<body>
<div class="main-content">
		<div class="widget">
			<h2>Student Details</h2>
			<table>
				<thead>
					<tr>
						<th>name</th>
						<th>course</th>
						<th>email</th>
						<th>mobile</th>
						<th>password</th>
						<th>action</th>
					</tr>
				</thead>

				<tbody>
				
					<%
					String id = request.getParameter("id");
					String name = request.getParameter("name");
					String mobile = request.getParameter("course");
					String city = request.getParameter("email");
					String contact = request.getParameter("mobile");
					String password = request.getParameter("password");

					try {

						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
						String sql = "select * from log";
						PreparedStatement pst = con.prepareStatement(sql);

						ResultSet rs = pst.executeQuery();
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("id")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("course")%></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getString("mobile")%></td>
						<td><%=rs.getString("password")%></td>
						<td><a href="edit.jsp?id=<%=rs.getString("id")%>">Edit</a></td>
                            <td><a href="delete.jsp?id=<%=rs.getString("id")%>">Delete</a></td>
					</tr>
					<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					} finally {

					}
					%>
				</tbody>

			</table>
		</div>
		
	</div>

</body>
</html>