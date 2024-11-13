package egovframework.example.admin.seats.model;

import java.sql.Date;

public class ASeatsVO {

	private int seatId;
	private String userid;
	private String seatNum;
	private String status;
	private Date seatTime;

	/**
	 * @seatId@ getter
	 * @return	seatId
	 */
	public int getSeatId() {
		return seatId;
	}

	/**
	 * @seatId@ setter
	 * @param	seatId
	 */
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	/**
	 * @userid@ getter
	 * @return	userid
	 */
	public String getUserid() {
		return userid;
	}

	/**
	 * @userid@ setter
	 * @param	userid
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	/**
	 * @seatNum@ getter
	 * @return	seatNum
	 */
	public String getSeatNum() {
		return seatNum;
	}

	/**
	 * @seatNum@ setter
	 * @param	seatNum
	 */
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	/**
	 * @status@ getter
	 * @return	status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @status@ setter
	 * @param	status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @seatTime@ getter
	 * @return	seatTime
	 */
	public Date getSeatTime() {
		return seatTime;
	}

	/**
	 * @seatTime@ setter
	 * @param	seatTime
	 */
	public void setSeatTime(Date seatTime) {
		this.seatTime = seatTime;
	}

	/** 
	 *
	 * @return
	 *
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */

	@Override
	public String toString() {
		return "ASeatsVO [seatId=" + seatId + ", userid=" + userid + ", seatNum=" + seatNum + ", status=" + status + ", seatTime=" + seatTime + "]";
	}

}
