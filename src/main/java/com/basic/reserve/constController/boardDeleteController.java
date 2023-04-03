package com.basic.reserve.constController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.BoardDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Board;

public class boardDeleteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		Board b = new Board();
		b.setId(id);
		
		BoardDAO.getInstance().DeleteBoard(b);
		
		
		List<Board>list = BoardDAO.getInstance().getAllBoard();
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
