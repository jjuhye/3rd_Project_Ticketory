package com.basic.reserve.constController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.reserve.dao.BoardDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Board;

public class boardEditController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");
				
		Board b = new Board();
		b.setId(id);
		b.setTitle(title);
		b.setBody(body);
		
		BoardDAO.getInstance().editBoard(b);
		
		return "board";
	}
}
