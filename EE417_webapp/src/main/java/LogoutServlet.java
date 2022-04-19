

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		
		//Getting the value from the hidden field
		String name=request.getParameter("uname");
		//PrintWriter out=response.getWriter();
		Cookie ck=new Cookie("user","");
		ck.setMaxAge(0);
		response.addCookie(ck);
		Cookie ck1=new Cookie("pre","");//clearing the cooking
		ck1.setMaxAge(0);//setting age to zero seconds
		response.addCookie(ck1);
		RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
		if(name!=null) {	//Used in the case of hidden forms
		request.setAttribute("name", name+" You have been Successfully logged out of your Account!");}
		else
			request.setAttribute("name", "You have been Successfully logged out of your Account!");
		rd.forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
