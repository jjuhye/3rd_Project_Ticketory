package com.basic.reserve.constController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;

public class PointController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int poval = Integer.parseInt(request.getParameter("poval"));
		
		Member m = new Member();
		m.setId(id);
		m.setMemberPoints(poval);
		System.out.println(poval);
		
		MemberDAO.getInstance().updatePoints(m);
		
		
		return "adminmember";
	}
}
