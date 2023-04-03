package com.basic.reserve.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

import com.basic.reserve.constController.APICall;
import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Ticket;

public class TicketAddController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(request.getParameter("category") == null) {
			return "addticket";
		}else {
			
			try {
				APICall.getInstance().getId("GGGA");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (ParserConfigurationException e) {
				e.printStackTrace();
			}
			
			HttpSession session = request.getSession();
			List<Ticket> list = TicketDAO.getInstance().getAllTicketList();
			session.setAttribute("ticketAllList",list);
			
			return "adminticket";
		}
	}
}
