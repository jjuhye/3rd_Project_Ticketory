package com.basic.reserve.vo;

public class Member {

	private int id;
	private String memberName;
	private String memberId;
	private String memberPw;
	private String memberHP;
	private int memberPoints;
	
	public Member(){};
	
	public Member(int memberSeq, String memberName, String memberId, String memberPw, String memberHP,int memberPoints) {
		super();
		this.id = memberSeq;
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberHP = memberHP;
		this.memberPoints = memberPoints;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberHP() {
		return memberHP;
	}
	public void setMemberHP(String memberHP) {
		this.memberHP = memberHP;
	}
	  
	public int getMemberPoints() {
		return memberPoints;
	}

	public void setMemberPoints(int memberPoints) {
		this.memberPoints = memberPoints;
	}

	public void name() {

	}
	
	
	
	
}















