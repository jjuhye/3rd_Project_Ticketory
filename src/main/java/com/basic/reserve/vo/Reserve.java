package com.basic.reserve.vo;

public class Reserve {


	private int id;
	private String memberId;
	private String reserveTitle;
	private String reserveDate;
	private String reserveLocation;
	private int reserveSeatNum;
	private int reservePrice;
	private int review;
	
	
	public Reserve(){}
	
	public Reserve(String memberId, String reserveTitle, String reserveDate, String reserveLocation,
			int reserveSeatNum, int reservePrice) {
		this.memberId = memberId;
		this.reserveTitle = reserveTitle;
		this.reserveDate = reserveDate;
		this.reserveLocation = reserveLocation;
		this.reserveSeatNum = reserveSeatNum;
		this.reservePrice = reservePrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReserveTitle() {
		return reserveTitle;
	}

	public void setReserveTitle(String reserveTitle) {
		this.reserveTitle = reserveTitle;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getReserveLocation() {
		return reserveLocation;
	}

	public void setReserveLocation(String reserveLocation) {
		this.reserveLocation = reserveLocation;
	}

	public int getReserveSeatNum() {
		return reserveSeatNum;
	}

	public void setReserveSeatNum(int reserveSeatNum) {
		this.reserveSeatNum = reserveSeatNum;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}
	
	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}
	
	
	
	
}
