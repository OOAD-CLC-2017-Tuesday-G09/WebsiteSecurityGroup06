package controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.History;
import model.HistoryLogin;
import model.User;
import dao.UserDAOImpl;
import dao.HistoryDAOImpl;
import dao.HistoryLoginDAOImpl;
import dao.HistoryLoginDao;
import dao.VerifyRecaptcha;
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();
	  private HistoryLoginDAOImpl historloginDAO = new HistoryLoginDAOImpl();
	private List<Cart> cart = new ArrayList<Cart>();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		String token = UUID.randomUUID().toString();
		session.setAttribute("csrfToken", token);
		int countlogin=0;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String err = "";
		// get reCAPTCHA request param
				String gRecaptchaResponse = request
						.getParameter("g-recaptcha-response");
				System.out.println(gRecaptchaResponse);
				boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		if (username.equals("") || password.equals("")) {
			err += "vui long nhap thong tin!";
		} else {
			if (userDAO.login(username, password) == false) {
				err += "username hoac pass sai!";
				if (historloginDAO.checkUser(username) == true) {
					HistoryLogin u = historloginDAO.getHitory(username);
					countlogin=u.getCountlogin()+1;
					System.out.println(countlogin);
					 HistoryLogin h = new HistoryLogin(u.getId(),username,countlogin,"");
					 historloginDAO.updateHistory(h);
					 request.setAttribute("logincount", countlogin);
				}
				else
				{
					countlogin=1;
				 HistoryLogin h = new HistoryLogin(0,username,countlogin,"");
				 historloginDAO.addHistory(h);
				 session.setAttribute("logincount", countlogin);
				}
				 }
		}

		if (err.length() > 0) {
			request.setAttribute("err", err);
		}
		
		String url = "/login.jsp";
		try {
			if (err.length() == 0) {
	            if(countlogin<3)
	            {
				session.setAttribute("username", username);
				session.setAttribute("cart", cart);
				userDAO.login(username, password);
				Cookie loginCookie = new Cookie("username",username);
	            //setting cookie to expiry in 30 mins
	            loginCookie.setMaxAge(30*60);
	            response.addCookie(loginCookie);
	            response.sendRedirect("index.jsp");
				url = "/index.jsp";
	            }
	            else
	            {
	            	if(verify)
	            	{
	            		session.setAttribute("username", username);
	    				session.setAttribute("cart", cart);
	    				userDAO.login(username, password);
	    				Cookie loginCookie = new Cookie("username",username);
	    	            //setting cookie to expiry in 30 mins
	    	            loginCookie.setMaxAge(30*60);
	    	            response.addCookie(loginCookie);
	    	            response.sendRedirect("index.jsp");
	    				url = "/index.jsp";
	            	}
	            }
			} else {
				url = "/login.jsp";
				RequestDispatcher rd = getServletContext()
						.getRequestDispatcher(url);
				rd.forward(request, response);
				request.setAttribute("err","kiem tra lai capcha!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/login.jsp");
		}
	}

}
