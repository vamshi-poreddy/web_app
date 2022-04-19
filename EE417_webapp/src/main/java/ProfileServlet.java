

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		request.getRequestDispatcher("profile.html").include(request, response);
		String name=null;
		String pre =null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
		for(Cookie ck : cookies){
			if(ck.getName().equals("user")) name = ck.getValue();	//calling the cookie with certain values
			else if(ck.getName().equals("pre")) pre = ck.getValue();	
		}
				out.print("<center><b>Welcome to Profile</b></center>");
				out.print("<b>User details as below</b></br>");
				out.print("Logged in as: <b>"+name+"</b></br>");
				out.print("Account Previlage: <b>"+pre+"</b>");
		}
		else{
			out.print("<center><b>Please login first</b></center>");
			request.getRequestDispatcher("account.html").include(request, response);
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
