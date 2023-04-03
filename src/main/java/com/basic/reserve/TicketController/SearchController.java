package com.basic.reserve.TicketController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Ticket;

public class SearchController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getParameter("searchData") == null ) {
			return "search";
		}else {
			System.out.println("들어옴");
			HttpSession session = request.getSession();
			String s = request.getParameter("searchData");
			Ticket t = new Ticket();
			t.setTitle(s);
			List<Ticket>list = TicketDAO.getInstance().getSelectiveTicketList(t);
			session.setAttribute("TicketList", list);
		}
		
		
		return "search";
	}
}
