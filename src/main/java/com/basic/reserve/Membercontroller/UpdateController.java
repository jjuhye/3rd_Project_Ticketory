package com.basic.reserve.Membercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;

public class UpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String input = request.getParameter("input");
		if(request.getParameter("pos").equals("1")) {
			
			HttpSession session = request.getSession();
			Member m = new Member();
			System.out.println(request.getParameter("pw"));
			
			m.setMemberId((String)session.getAttribute("id"));
			
				m.setMemberPw(input);
				MemberDAO.getInstance().updatePw(m);
				response.getWriter().print("1");
				return null;
			
		}else {
			
			HttpSession session = request.getSession();
			Member m = new Member();
			
			m.setMemberId((String)session.getAttribute("id"));
			m.setMemberHP(input);
			
			String log = MemberDAO.getInstance().login(m);
			System.out.println(log);
			
				MemberDAO.getInstance().updateHp(m);
				response.getWriter().print("1");
				return null;
		}
	}

}
