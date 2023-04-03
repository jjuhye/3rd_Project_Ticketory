package com.basic.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.basic.reserve.util.MybatisConfig;
import com.basic.reserve.vo.Member;
import com.basic.reserve.vo.Reserve;
import com.basic.reserve.vo.Ticket;

public class ReserveDAO {
	private ReserveDAO(){}
	static public ReserveDAO rdao = new ReserveDAO();
	static public ReserveDAO getInstance() {
		return rdao;
	}
	
	public List<Reserve> getAllReserveList() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Reserve> list = session.selectList("mapper.reserve.selectAllReserve");
		session.close();
		return list;
	}
	
	public List<Reserve> getlastReserveList() {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Reserve> list = session.selectList("mapper.reserve.getLastReserve");
		session.close();
		return list;
	}
	
	public List<Reserve> getSelectiveReserve(Reserve r) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Reserve> list = session.selectList("mapper.reserve.selectiveReserve",r);
		session.close();
		return list;
	}
	
	public List<Reserve> getoneReserveListbyID(Reserve r) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		List<Reserve> list = session.selectList("mapper.reserve.selectoneReservebyId",r);
		session.close();
		return list;
	}
	
	public String addReserve(Reserve r) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		String log = session.selectOne("mapper.reserve.addReserve",r);
		session.close();
		return log;
	}
	
	public String deleteReserve(Reserve r) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		String log = session.selectOne("mapper.reserve.reserveDelete",r);
		session.close();
		return log;
	}

	public void updateSeat(Ticket t) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.ticket.updateTickets",t);
		session.close();
	}

	public void updateReview(Reserve r) {
		SqlSession session = MybatisConfig.getInstance().openSession(true);
		session.selectOne("mapper.reserve.updateReview",r);
		session.close();
	}

	
	
}
