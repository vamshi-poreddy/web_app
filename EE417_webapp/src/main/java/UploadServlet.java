

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
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
		//doGet(request, response);
		Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String JDBCUrl = "jdbc:mysql://database-1.cdh305awjour.eu-west-1.rds.amazonaws.com:3306/mydatabase"; //cloud data base 
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
        //Reading the inputs from the form in register.html
       String firstname = request.getParameter("firstname");
       String lastname = request.getParameter("lastname");
       String email = request.getParameter("email");
       String pass = request.getParameter("pas");
       String gender = request.getParameter("gen");
       String dob = request.getParameter("dateob");
       String address = request.getParameter("addr");
       String phone = request.getParameter("tel");
       String card = request.getParameter("mc");
       
      
	 try {
		  PreparedStatement pstmt = con.prepareStatement("INSERT INTO mydatabase.customers(firstname,lastname,email,pass,gender, dob,address,phone,card) VALUES (?,?,?,?,?,?,?,?,?)");
				  pstmt.clearParameters();       // Clears any previous parameters
				  pstmt.setString(1, firstname);
				  pstmt.setString(2, lastname);
				  pstmt.setString(3, email);
				  pstmt.setString(4, pass);
				  pstmt.setString(5, gender);
				  pstmt.setString(6, dob);
				  pstmt.setString(7, address);
				  pstmt.setString(8, phone);
				  pstmt.setString(9, card);
				  pstmt.executeUpdate();	//Updating the table
	 }
        catch (SQLException e) {
	     System.out.println("\nAn error has occurred during the Statement/ResultSet phase.  Please check the syntax and study the Exception details!");
            while (e != null) {
	         System.out.println(e.getMessage());
                e = e.getNextException();
	     }
            System.exit(0);
        }

        finally {	//tries to close the connection even if there was an error while inserting into the table
	     try {    
	         if (rs != null) rs.close();
		 if (stmt != null) stmt.close();
		 if (con != null) con.close();
	     }
	     catch (Exception ex) {
	         System.out.println("An error occurred while closing down connection/statement"); 
            }
        }
	 request.getRequestDispatcher("account.html").include(request, response); //After registration ends it goes to login page
		
	}

}
