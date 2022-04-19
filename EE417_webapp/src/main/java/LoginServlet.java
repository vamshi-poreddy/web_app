

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.Cookie;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("Email");
		String password=request.getParameter("password");
		
		
		//Admin Login Details verification and setting extra page admin
		if(name.equals("admin")&& password.equals("ee417")){
			out.print("You are successfully logged in!");
			out.print("<br>Welcome, "+name+"<br>");
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			request.setAttribute("name", name);
			request.setAttribute("set","Customer Data");
			request.setAttribute("setpage", "datatable.jsp");
			request.setAttribute("text", "Customer Queries");
			request.setAttribute("link", "queries.jsp");	//Displays the contents of the database
			rd.forward( request, response );
			Cookie ck=new Cookie("user",name);//creating a cookie with name as uname
			Cookie ck1=new Cookie("pre","Admin");
			response.addCookie(ck);//adding cookie to the response
			response.addCookie(ck1);
		}
		//Verifying Other User details password and showing the required pages
		else if(password.equals("dcu")||password.equals("webdev")) {
			Cookie ck1=new Cookie("user",name);
			Cookie ck2=new Cookie("pre","Standard_User");
			response.addCookie(ck1);
			response.addCookie(ck2);
			String uname=null;
			Cookie[] cookies = request.getCookies();
			if(cookies !=null){
			for(Cookie ck : cookies)
				if(ck.getName().equals("user")) uname = ck.getValue();
			}
			out.print("<center>You are successfully logged in!<br>");
			out.print("<form action='LogoutServlet'>");
			out.print("<input type='hidden' name='uname' value='"+name+"'>");
			out.print("<input type='submit' value='Logout'>");
			out.print("</form></center>");
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			request.setAttribute("name", name);
			request.setAttribute("set","Contact Us");
			request.setAttribute("setpage", "contact.html");
			request.setAttribute("text", "Cart");
			request.setAttribute("link", "cart.html");
			rd.include( request, response );
		}
		else{
			out.print("<center><b>Sorry, Username or Password is incorrect!</b></center>");
			request.getRequestDispatcher("account.html").include(request, response);
		}
		
		out.close();
	}
}
