package egovframework.example.admin.seats.model;

import java.sql.Date;

public class ASeatsVO {

	private int seatId;
	private String userid;
	private String seatNum;
	private String status;
	private Date seatTime;
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getSeatTime() {
		return seatTime;
	}
	public void setSeatTime(Date seatTime) {
		this.seatTime = seatTime;
	}
	
	@Override
	public String toString() {
		return "ASeatsVO [seatId=" + seatId + ", userid=" + userid + ", seatNum=" + seatNum + ", status=" + status
				+ ", seatTime=" + seatTime + "]";
	}
	
	
}
