package egovframework.example.service.model;

import java.sql.Date;

public class MultiVO {
	
	private int seatId;
	private String seatNum;
	private String status;
	private String userid;
	private Date seatTime;
	private String seatTimeStr;
	
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getSeatTime() {
		return seatTime;
	}
	public void setSeatTime(Date seatTime) {
		this.seatTime = seatTime;
	}
	public String getSeatTimeStr() {
		return seatTimeStr;
	}
	public void setSeatTimeStr(String seatTimeStr) {
		this.seatTimeStr = seatTimeStr;
	}
	
	@Override
	public String toString() {
		return "MultiVO [seatId=" + seatId + ", seatNum=" + seatNum + ", status=" + status + ", userid=" + userid
				+ ", seatTime=" + seatTime + ", seatTimeStr=" + seatTimeStr + "]";
	}
	
	
}
