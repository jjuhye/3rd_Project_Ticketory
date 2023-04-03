package com.basic.reserve.Membercontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basic.reserve.dao.MemberDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Member;

public class MyPageController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String ctx = request.getContextPath();
			out.println("<script>alert('로그인 후 확인 가능합니다.');location.href='"+ctx+"/main.do'; </script>");
			return null;
		}else {
			if(request.getParameter("pw") != null){
				String id = (String)session.getAttribute("id");
				String pw = request.getParameter("pw");
				System.out.println(id + "  " +pw);
				Member m = new Member();
				m.setMemberId(id);
				m.setMemberPw(pw);
				
				int result = MemberDAO.getInstance().DeleteMember(m);
				System.out.println(result);
				if(result >= 1) {
					session.removeAttribute("id");
					response.getWriter().print("1");
				}else {
					response.getWriter().print("null");
				}
				return null;
			}
			
		}
		return "mypage";
	}
}
