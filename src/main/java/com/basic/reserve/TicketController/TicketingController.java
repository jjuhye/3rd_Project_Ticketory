package com.basic.reserve.TicketController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.ReserveDAO;
import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Reserve;
import com.basic.reserve.vo.Ticket;

public class TicketingController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(request.getParameter("placename") == null) {
			int idNum = Integer.parseInt(request.getParameter("title"));
			Ticket t = new Ticket();
			t.setId(idNum);
			
			List<Ticket>list = TicketDAO.getInstance().getSelectiveTicketListbyId(t);
			
			session.setAttribute("selection",list);
			
			
			return "ticketing";
		}else {
			List<Ticket>list = (List<Ticket>) session.getAttribute("selection");
			
			
			
			String memberId = (String) session.getAttribute("id");
			
			String reserveTitle = list.get(0).getTitle();
			String reserveDate = request.getParameter("rdate");
			String reserveLocation = list.get(0).getLocation();
			
			int reserveSeatNum = Integer.parseInt(request.getParameter("seatNum"));
			int currentSeatNum = list.get(0).getSeatNum() - reserveSeatNum;
			
			int reservePrice = Integer.parseInt(request.getParameter("price"));
			
			Reserve r = new Reserve(memberId,reserveTitle,reserveDate,reserveLocation,reserveSeatNum,reservePrice);
			Ticket t = new Ticket();
			t.setId(list.get(0).getId());
			t.setSeatNum(currentSeatNum);
			
			
			ReserveDAO.getInstance().addReserve(r);
			ReserveDAO.getInstance().updateSeat(t); 
			
			return "ticketingpro";
		}
	}
}
