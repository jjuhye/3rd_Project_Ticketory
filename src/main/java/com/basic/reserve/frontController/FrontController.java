package com.basic.reserve.frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.do")
public class FrontController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = request.getRequestURI();
		String ctx = request.getContextPath();
		
		String cmd = url.substring(ctx.length());
		
		HandlerMapping handlermap = new HandlerMapping();
		Controller con = handlermap.getController(cmd);
		
		String nextPage = con.requestHandler(request, response);
		
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")!=-1) {
				response.sendRedirect(nextPage.split(":")[1]);
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(viewResolve.makeView(nextPage)); // forward
				rd.forward(request, response);
			}
		}		
	}
}



