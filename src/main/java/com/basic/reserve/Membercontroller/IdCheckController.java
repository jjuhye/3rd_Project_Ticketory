package com.basic.reserve.Membercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;


public class IdCheckController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Member m = new Member();
		m.setMemberId(request.getParameter("id"));

		String log = MemberDAO.getInstance().validcheck(m);
		
		if(log ==null) {
			response.getWriter().print("null");
		}else {
			response.getWriter().print("1");
		}
		
		return null;
	}

}
