package com.basic.reserve.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Ticket;

public class TicketManagementController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("num") != null) {

			int num = Integer.parseInt(request.getParameter("num"));
			Ticket t = new Ticket();
			t.setId(num);
			
			TicketDAO.getInstance().deleteSelectiveTicket(t);
			
		}else if(request.getParameter("id") != null){
			int id = Integer.parseInt(request.getParameter("id"));
			String title = request.getParameter("title");
			int star = Integer.parseInt(request.getParameter("star"));
			String sdate = request.getParameter("sdate");
			String edate = request.getParameter("edate");
			
			Ticket t = new Ticket();
			t.setId(id);
			
			List<Ticket>onelist = TicketDAO.getInstance().getSelectiveTicketListbyId(t);
			t = onelist.get(0);
			
			t.setTitle(title);
			t.setStar(star);
			t.setDateStart(sdate);
			t.setDateEnd(edate);
		
			TicketDAO.getInstance().updateTicket(t);
		}

		HttpSession session = request.getSession();
		List<Ticket> list = TicketDAO.getInstance().getAllTicketList();
		session.setAttribute("ticketAllList", list);
		return "adminticket";
	}
}
