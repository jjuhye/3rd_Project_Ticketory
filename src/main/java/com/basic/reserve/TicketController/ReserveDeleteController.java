package com.basic.reserve.TicketController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basic.reserve.dao.ReserveDAO;
import com.basic.reserve.dao.TicketDAO;
import com.basic.reserve.frontController.Controller;
import com.basic.reserve.vo.Reserve;
import com.basic.reserve.vo.Ticket;

public class ReserveDeleteController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String check[]= request.getParameterValues("checkedIds");
		
		for (String idx : check) {
			
			int indexNum = Integer.parseInt(idx);
			Reserve r = new Reserve();
			r.setId(indexNum);
			
			List<Reserve>temp = ReserveDAO.getInstance().getoneReserveListbyID(r);
			String name = temp.get(0).getReserveTitle();
			Ticket t = new Ticket();
			t.setTitle(name);
			List<Ticket>tklist =  TicketDAO.getInstance().getSelectiveTicketList(t);
			int currentSeatNum = tklist.get(0).getSeatNum() + temp.get(0).getReserveSeatNum();
			t.setId(tklist.get(0).getId());
			t.setSeatNum(currentSeatNum);
			ReserveDAO.getInstance().updateSeat(t); 
			ReserveDAO.getInstance().deleteReserve(r);
			
			
		}
		return null;
	}
}
