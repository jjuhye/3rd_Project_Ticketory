package com.basic.reserve.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;

public class AdminMemberController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("id") == null) {
			List<Member>list = MemberDAO.getInstance().getAllMemberList();
			request.setAttribute("mlist", list);
			return "adminmember";
		}
		
		
		
		return null;
	}

}
