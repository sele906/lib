package egovframework.example.service.model;

import java.sql.Date;

public class MultiVO {
	private int seatId;
	private String seatNum;
	private String status;
	private String userid;
	private Date seatTime;
	private String seatTimeStr;

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
	 * @seatTimeStr@ getter
	 * @return	seatTimeStr
	 */
	public String getSeatTimeStr() {
		return seatTimeStr;
	}

	/**
	 * @seatTimeStr@ setter
	 * @param	seatTimeStr
	 */
	public void setSeatTimeStr(String seatTimeStr) {
		this.seatTimeStr = seatTimeStr;
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
		return "MultiVO [seatId=" + seatId + ", seatNum=" + seatNum + ", status=" + status + ", userid=" + userid + ", seatTime=" + seatTime + ", seatTimeStr=" + seatTimeStr + "]";
	}

}
