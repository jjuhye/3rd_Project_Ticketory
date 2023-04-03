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

public class MainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String page = "Main";
		LocalDate now = LocalDate.now();
		List<Ticket>newshow = TicketDAO.getInstance().getNewShow();
		List<Ticket>newsports = TicketDAO.getInstance().getNewSports();
		
		List<Ticket>ascshow = TicketDAO.getInstance().getAscShow();
		List<Ticket>ascsports = TicketDAO.getInstance().getAscSports();
		
		List<Ticket>rankmovie = TicketDAO.getInstance().getRankingMovie();
		List<Ticket>rankshow = TicketDAO.getInstance().getRankingShow();
		List<Ticket>ranksports = TicketDAO.getInstance().getRankingSports();
		
		HttpSession session = request.getSession();
		request.setAttribute("newshow", newshow);
		request.setAttribute("newsports", newsports);
		
		request.setAttribute("rankshow", rankshow);
		request.setAttribute("rankmovie", rankmovie);
		request.setAttribute("ranksports", ranksports);
		
		request.setAttribute("ascshow", ascshow);
		request.setAttribute("ascsports", ascsports);
		
		if(request.getParameter("page") != null) {
			page = request.getParameter("page");
		}
		
		session.setAttribute("now", now);
		return page;
	}
}
