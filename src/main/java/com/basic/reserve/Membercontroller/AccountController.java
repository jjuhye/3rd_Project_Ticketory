package com.basic.reserve.Membercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;

public class AccountController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = "";
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("id") == null) {
			page = "account";
		}else {
			Member m = new Member();
			m.setMemberId(request.getParameter("id"));
			m.setMemberPw(request.getParameter("pw1"));
			m.setMemberName(request.getParameter("name"));
			m.setMemberHP(request.getParameter("hp"));
			m.setMemberPoints(3000);
			System.out.println(MemberDAO.getInstance().addMember(m));
			page = "Main";
		}
		
		return page;
	}

}
