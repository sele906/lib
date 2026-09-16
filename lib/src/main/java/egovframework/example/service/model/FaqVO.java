package egovframework.example.service.model;

import java.sql.Date;

public class FaqVO {
	
	private int faqId;
	private String userid;
	private String title;
	private String cnt;
	private Date writeDate;
	
	public int getFaqId() {
		return faqId;
	}
	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqId=" + faqId + ", userid=" + userid + ", title=" + title + ", cnt=" + cnt + ", writeDate="
				+ writeDate + "]";
	}
	
	
}
