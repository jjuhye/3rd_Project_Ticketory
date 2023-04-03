package com.basic.reserve.TicketController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.dao.ReserveDAO;
import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;
import com.basic.reserve.vo.Reserve;
import com.basic.reserve.vo.Ticket;

public class TicketingProController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String ctx = request.getContextPath();
			out.println("<script>alert('로그인 후 확인 가능합니다.');location.href='"+ctx+"/main.do'; </script>");
			return null;
		}else {
			if(request.getParameter("tid") == null) {
			List<Reserve>res = ReserveDAO.getInstance().getAllReserveList();
			request.setAttribute("res",res);
			
			return "ticketingpro";
			}
		}
		
		
		
		int mid =  Integer.parseInt(request.getParameter("id"));
		int tid = Integer.parseInt(request.getParameter("tid"));
		int seat = Integer.parseInt(request.getParameter("seat"));
		int price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		
		Member m = new Member();
		m.setId(mid);
		Ticket t = new Ticket();
		t.setId(tid);
		
		List<Member>mlist = MemberDAO.getInstance().getOneMemberListbyId(m);
		List<Ticket>tlist = TicketDAO.getInstance().getSelectiveTicketListbyId(t);
		
		int reserveSeatNum = Integer.parseInt(request.getParameter("seat"));
		int currentSeatNum = tlist.get(0).getSeatNum() - reserveSeatNum;
		t.setSeatNum(currentSeatNum);
		
		int currentPoint = mlist.get(0).getMemberPoints() - Integer.parseInt(request.getParameter("points"));
		
		Reserve rsv = new Reserve(mlist.get(0).getMemberId() ,tlist.get(0).getTitle(), date,
				tlist.get(0).getLocation(),seat,price);
		m.setMemberPoints(currentPoint);
		ReserveDAO.getInstance().addReserve(rsv);
		ReserveDAO.getInstance().updateSeat(t);
		MemberDAO.getInstance().updatePoints(m);
		
		mlist = MemberDAO.getInstance().getOneMemberListbyId(m);
		session.setAttribute("mlist", mlist);
		
		return "ticketingpro";
	}
}
