package com.basic.reserve.constController;

import java.io.IOException;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.BoardDAO;
import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Board;
import com.basic.reserve.vo.Ticket;

public class boardController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//게시글 수정
		HttpSession session = request.getSession();
		if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			Board b = new Board();
			b.setId(id);
			b.setMemberId("memberId");
			b.setTitle(request.getParameter("title"));
			b.setBody(request.getParameter("body"));
			b.setWritedate(request.getParameter("writedate"));
			BoardDAO.getInstance().updateBoard(b);
		//게시글 추가
		}else if(request.getParameter("memberId") != null && request.getParameter("title")!=null){
			Board b = new Board();
			b.setMemberId(request.getParameter("memberId"));
			b.setTitle(request.getParameter("title"));
			b.setBody(request.getParameter("body"));
			Date date = new Date();
			
			String dateToStr = date.toInstant()
					.atOffset(ZoneOffset.UTC)
					.format( DateTimeFormatter.ofPattern("yyyy-mm-dd"));
			
			b.setWritedate(dateToStr);
			BoardDAO.getInstance().addBoard(b);
		}
		
		Board b = new Board();
		String log = (String)session.getAttribute("id");
		if(log == null) {
			log = "";
		}
		List<Board>list = null;
		
		if(log.equals("admin")) {
			list = BoardDAO.getInstance().getAllBoard();
		}else {
			b.setMemberId(log);
			list = BoardDAO.getInstance().getSelectiveBoard(b);
		}
		
		ArrayList<Board>temp = new ArrayList<Board>();
		int currentPage = 1;
		int onepage = 4;
		int totalBoardCnt = list.size();
		int paging = totalBoardCnt / onepage + 1;
		int endidx = 0;
		
		if(request.getParameter("pnum") != null) {
			currentPage = Integer.parseInt(request.getParameter("pnum"));
		}else {
			currentPage = 1;
		}
		endidx = currentPage == paging ? totalBoardCnt % onepage : onepage * currentPage ;
		
		int startidx = onepage * (currentPage - 1);
		
		for (int i = startidx; i < endidx + startidx; i++) {
			temp.add(list.get(i));
		}
		
		request.setAttribute("blist", temp);
		request.setAttribute("paging", paging);
		
		return "board";
	}

}
