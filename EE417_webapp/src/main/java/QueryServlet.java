

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryServlet() {
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
		Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String JDBCUrl = "jdbc:mysql://database-1.cdh305awjour.eu-west-1.rds.amazonaws.com:3306/mydatabase";
        String username = "admin";
        String password = "ee417web";
        response.setContentType("text/html");
		PrintWriter out=response.getWriter();
        try {
            System.out.println("\nConnecting to the SSD Database......");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(JDBCUrl, username, password);
        }
        catch (Exception e) {
            System.out.println("\nAn error has occurred during the connection phase!  This is most likely due to your CLASSPATH being set wrong and the"
                    + "  classes unable to be found.  Otherwise the database itself may be down.  Try telneting to port 3306 and see if it is up!");
            e.printStackTrace();
            System.exit(0);
        }   

       String name = request.getParameter("fullname");
       String email = request.getParameter("Email");
       String type = request.getParameter("query");
       String details = request.getParameter("det");
       
      
	 try {
		  PreparedStatement pstmt = con.prepareStatement("INSERT INTO mydatabase.queries(fullname,email,querytype, details) VALUES (?,?,?,?)");
				  pstmt.clearParameters();       // Clears any previous parameters
				  pstmt.setString(1, name);
				  pstmt.setString(2, email);
				  pstmt.setString(3, type);
				  pstmt.setString(4, details);
				  pstmt.executeUpdate();
	 }
        catch (SQLException e) {
	     System.out.println("\nAn error has occurred during the Statement/ResultSet phase.  Please check the syntax and study the Exception details!");
            while (e != null) {
	         System.out.println(e.getMessage());
                e = e.getNextException();
	     }
            System.exit(0);
        }

        finally {
	     try {    
	         if (rs != null) rs.close();
		 if (stmt != null) stmt.close();
		 if (con != null) con.close();
	     }
	     catch (Exception ex) {
	         System.out.println("An error occurred while closing down connection/statement");
            }
        }
	 //request.getRequestDispatcher("contact.html").include(request, response);
	 request.getRequestDispatcher("RegisterServlet").include(request, response);
		
	}
	
}
