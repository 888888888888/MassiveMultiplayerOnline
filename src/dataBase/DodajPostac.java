package dataBase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DodajPostac
 */
@WebServlet("/DodajPostac")
public class DodajPostac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DodajPostac() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String login = request.getParameter("login"); 
		String imie = request.getParameter("imie");
		String klasa = request.getParameter("klasa");
		String avatar = request.getParameter("avatar");
		
		String query = "INSERT INTO Champion (idUser,IMIE,KLASA,idAvatar) VALUES  ((SELECT IdUser FROM User WHERE login ='"+login+"'), '" + imie + "','" + klasa + 
				"',"+avatar+ ");";
		
		System.out.println(query);
        try {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/massive", "root", "");
			
			Statement statement = conn.createStatement();
			statement.execute(query);
			conn.close();
			response.sendRedirect("http://localhost:8080/MassiveMultiplaerOnline/aliorbank.pl/hades/do/Game.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
