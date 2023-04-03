package com.basic.reserve.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;

public class AdminMemberDelController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Member m = new Member();
		m.setId(id);
		MemberDAO.getInstance().DeleteMemberbyID(m);
		List<Member>list = MemberDAO.getInstance().getAllMemberList();
		request.setAttribute("mlist", list);
		return "adminmember";
	}
}
