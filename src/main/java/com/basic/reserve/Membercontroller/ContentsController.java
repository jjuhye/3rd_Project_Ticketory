package com.basic.reserve.Membercontroller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;
import com.basic.reserve.vo.Ticket;

public class ContentsController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String page = "contents";
		/* LocalDate now = LocalDate.now(); */
		
		List<Ticket>ascshow = TicketDAO.getInstance().getAscShow();
		List<Ticket>ascsports = TicketDAO.getInstance().getAscSports();
		
		/* HttpSession session = request.getSession(); */
		
		String category=request.getParameter("ctg");
		
		request.setAttribute("ascshow", ascshow);
		request.setAttribute("ascsports", ascsports);
		request.setAttribute("category", category);
		
		/* session.setAttribute("now", now); */
		return page;
	}
}
