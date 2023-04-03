package com.basic.reserve.constController;

import java.io.IOException;
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

public class ReviewController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int id = Integer.parseInt(request.getParameter("id"));
		int star = Integer.parseInt(request.getParameter("star"));
		int mid = Integer.parseInt(request.getParameter("mid"));
		Reserve r = new Reserve();
		r.setId(id);
		r.setReview(star);
		Member m = new Member();
		m.setId(mid);
		List<Member>mlist = MemberDAO.getInstance().getOneMemberListbyId(m);
		int currentPoint = mlist.get(0).getMemberPoints() + 2000;
		m.setMemberPoints(currentPoint);
		
		ReserveDAO.getInstance().updateReview(r);
		MemberDAO.getInstance().updatePoints(m);
		
		mlist = MemberDAO.getInstance().getOneMemberListbyId(m);
		session.setAttribute("mlist", mlist);
		
		 List<Reserve>rlist = ReserveDAO.getInstance().getoneReserveListbyID(r);
		 String reservetitle = rlist.get(0).getReserveTitle();
		
		List<Reserve>tlist =  ReserveDAO.getInstance().getAllReserveList();
		int count = 1 ;
		for (Reserve reserve : tlist) {
			if(reservetitle.equals(reserve.getReserveTitle()) && reserve.getReview() != 0){
				count ++;
			}
		}
		
		Ticket t = new Ticket();
		t.setTitle(reservetitle);
		
		List<Ticket> ticketlist = TicketDAO.getInstance().getSelectiveTicketList(t);
		int AVG = ticketlist.get(0).getStar();
		AVG = (AVG * (count -1) + star)/count ;
		
		t.setId(ticketlist.get(0).getId());
		t.setStar(AVG);
		System.out.println(AVG);
		TicketDAO.getInstance().updateStar(t);
		
		return "ticketingpro";
	}
}
