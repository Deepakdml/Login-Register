package register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/save")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Registration() {
		super();

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// System.out.println("Do get");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
//		PrintWriter out=rest.getWriter();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			System.out.println("DB connected");

			Statement stmnt = con.createStatement();

			int r=stmnt.executeUpdate(
					"insert into log values('" + name + "', '" + course + "', '" + email + "', '" + mobile + "', '" + password + "')");
			if(r>0) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.include(request, response);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
				dispatcher.include(request, response);
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

