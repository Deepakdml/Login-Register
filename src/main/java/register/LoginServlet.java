package register;

//import java.io.IOException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// System.out.println("Do get");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
			PreparedStatement pst = con.prepareStatement("select * from log where name = ? and password=?");
			pst.setString(1, name);
			pst.setString(2, password);
			System.out.println("Name: " + name + ", Password: " + password);
			ResultSet rs= pst.executeQuery();
			
			
			if(rs.next()) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.include(request, response);
			}
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.include(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}