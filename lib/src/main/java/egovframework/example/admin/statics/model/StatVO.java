package egovframework.example.admin.statics.model;

import java.sql.Date;

public class StatVO {

	private int logId;
	private String userid;
	private String level;
	private Date logTime;
	private String logTimeStr;
	
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public Date getLogTime() {
		return logTime;
	}
	public void setLogTime(Date logTime) {
		this.logTime = logTime;
	}
	public String getLogTimeStr() {
		return logTimeStr;
	}
	public void setLogTimeStr(String logTimeStr) {
		this.logTimeStr = logTimeStr;
	}
	
	@Override
	public String toString() {
		return "StatVO [logId=" + logId + ", userid=" + userid + ", level=" + level + ", logTime=" + logTime
				+ ", logTimeStr=" + logTimeStr + "]";
	}
	
}
