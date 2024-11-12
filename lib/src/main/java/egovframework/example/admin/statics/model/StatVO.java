package egovframework.example.admin.statics.model;

import java.sql.Date;

public class StatVO {
	private int logId;
	private String userid;
	private String level;
	private Date logTime;
	private String logTimeStr;

	/**
	 * @logId@ getter
	 * @return	logId
	 */
	public int getLogId() {
		return logId;
	}

	/**
	 * @logId@ setter
	 * @param	logId
	 */
	public void setLogId(int logId) {
		this.logId = logId;
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
	 * @level@ getter
	 * @return	level
	 */
	public String getLevel() {
		return level;
	}

	/**
	 * @level@ setter
	 * @param	level
	 */
	public void setLevel(String level) {
		this.level = level;
	}

	/**
	 * @logTime@ getter
	 * @return	logTime
	 */
	public Date getLogTime() {
		return logTime;
	}

	/**
	 * @logTime@ setter
	 * @param	logTime
	 */
	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}

	/**
	 * @logTimeStr@ getter
	 * @return	logTimeStr
	 */
	public String getLogTimeStr() {
		return logTimeStr;
	}

	/**
	 * @logTimeStr@ setter
	 * @param	logTimeStr
	 */
	public void setLogTimeStr(String logTimeStr) {
		this.logTimeStr = logTimeStr;
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
		return "StatVO [logId=" + logId + ", userid=" + userid + ", level=" + level + ", logTime=" + logTime + ", logTimeStr=" + logTimeStr + "]";
	}

}
