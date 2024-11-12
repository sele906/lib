package egovframework.example.service.model;

import java.sql.Date;

public class FaqVO {
	private int faqId;
	private String userid;
	private String title;
	private String cnt;
	private Date writeDate;

	/**
	 * @faqId@ getter
	 * @return	faqId
	 */
	public int getFaqId() {
		return faqId;
	}

	/**
	 * @faqId@ setter
	 * @param	faqId
	 */
	public void setFaqId(int faqId) {
		this.faqId = faqId;
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
	 * @title@ getter
	 * @return	title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @title@ setter
	 * @param	title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @cnt@ getter
	 * @return	cnt
	 */
	public String getCnt() {
		return cnt;
	}

	/**
	 * @cnt@ setter
	 * @param	cnt
	 */
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	/**
	 * @writeDate@ getter
	 * @return	writeDate
	 */
	public Date getWriteDate() {
		return writeDate;
	}

	/**
	 * @writeDate@ setter
	 * @param	writeDate
	 */
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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
		return "FaqVO [faqId=" + faqId + ", userid=" + userid + ", title=" + title + ", cnt=" + cnt + ", writeDate=" + writeDate + "]";
	}

}
