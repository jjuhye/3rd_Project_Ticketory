package com.basic.reserve.frontController;

import java.util.HashMap;

import com.basic.reserve.Admin.*;
import com.basic.reserve.Membercontroller.*;
import com.basic.reserve.TicketController.*;
import com.basic.reserve.constController.*;

public class HandlerMapping {
	private HashMap<String,Controller>mapping;
	public HandlerMapping() {
		mapping = new HashMap<String, Controller>();
		mapping.put("/main.do", new MainController());
		mapping.put("/contents.do", new ContentsController());
		mapping.put("/login.do", new LoginController());
		mapping.put("/account.do", new AccountController());
		mapping.put("/logout.do", new LogoutController());
		mapping.put("/mypage.do", new MyPageController());
		mapping.put("/update.do",new UpdateController());
		
		mapping.put("/board.do", new boardController());
		mapping.put("/boardDelete.do", new boardDeleteController());
		mapping.put("/boardedit.do", new boardEditController());
		
		mapping.put("/search.do", new SearchController());
		mapping.put("/ticketing.do", new TicketingController());
		mapping.put("/ticketingPro.do", new TicketingProController());
		mapping.put("/reserveCheck.do", new ReserveCheckController());
		mapping.put("/reserveDelete.do", new ReserveDeleteController());
		mapping.put("/idcheck.do",new IdCheckController());
		
		
		mapping.put("/ticketmanagement.do",new TicketManagementController());
		mapping.put("/addticket.do",new TicketAddController());
		mapping.put("/event.do",new EventController());
		mapping.put("/adminmember.do",new AdminMemberController());
		mapping.put("/admindelete.do",new AdminMemberDelController());
		mapping.put("/review.do",new ReviewController());
		mapping.put("/editpoint.do",new PointController());
		
		
		
		
	}
	
	public Controller getController(String key) {
		return mapping.get(key);
	}
}
