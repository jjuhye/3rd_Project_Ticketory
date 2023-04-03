package com.basic.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.basic.reserve.util.MybatisConfig;
import com.basic.reserve.vo.Ticket;

public class TicketDAO {

	private TicketDAO(){}
	private static TicketDAO mDAO = new TicketDAO();
	public static TicketDAO getInstance() {return mDAO;}
	
	public List<Ticket>getAllTicketList(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.selectAllTicket");
		session.close();
		return list;
	}
	
	public List<Ticket>getSelectiveTicketList(Ticket t){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.selectiveTicket",t);
		session.close();
		return list;
	}
	
	public List<Ticket>getSelectiveTicketListbyId(Ticket t){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.selectiveTicketbyId",t);
		session.close();
		return list;
	}
	
	public List<Ticket>getNewShow(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.getNewShow");
		session.close();
		return list;
	}
	
	public List<Ticket>getAscShow(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.getAscShow");
		session.close();
		return list;
	}
	
	
	  public List<Ticket>getAscSports(){ 
		  SqlSession session =MybatisConfig.getInstance().openSession(true);
		  List<Ticket> list =session.selectList("mapper.ticket.getAscSports"); session.close();
		  return list;
	  }
	
	public List<Ticket>getNewSports(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.getNewSports");
		session.close();
		return list;
	}
	
	
	public List<Ticket>getRankingShow(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.getRankingShow");
		session.close();
		return list;
	}
	
	public List<Ticket>getRankingMovie(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.getRankingmovie");
		session.close();
		return list;
	}
	
	public List<Ticket>getRankingSports(){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Ticket> list = session.selectList("mapper.ticket.getRankingSports");
		session.close();
		return list;
	}
	
	public void addTicket(Ticket t){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectList("mapper.ticket.addTicket",t);
		session.close();
	}
	
	public void deleteSelectiveTicket(Ticket t) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectList("mapper.ticket.deleteTicket",t);
		session.close();
	}
	
	public void updateTicket(Ticket t){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.ticket.updateTicket",t);
		session.close();
	}
	
	public void updateStar(Ticket t){
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.ticket.updateStars",t);
		session.close();
	}
	
	
	
}
