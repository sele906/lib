package egovframework.example;

import java.io.Serializable;

public class Pagination implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269358L;

	/** 검색조건 */
	/*private String sCon = "";*/

	/** 검색Keyword */
	private String sKey = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;

	//	CurrentPageNo
	private int page = 1;

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	/**
	 * @sCon@ getter
	 * @return	sCon
	 */
	/*public String getsCon() {
		return sCon;
	}
	
	*//**
		* @sCon@ setter
		* @param	sCon
		*//*
			public void setsCon(String sCon) {
			this.sCon = sCon;
			}*/

	/**
	 * @sKey@ getter
	 * @return	sKey
	 */
	public String getsKey() {
		return sKey;
	}

	/**
	 * @sKey@ setter
	 * @param	sKey
	 */
	public void setsKey(String sKey) {
		this.sKey = sKey;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/*public int getAfterIdx() {
		return afterIdx;
	}
	
	public void setAfterIdx(int afterIdx) {
		this.afterIdx = afterIdx;
	}
	
	public String getAfter() {
		return after;
	}
	
	public void setAfter(String after) {
		this.after = after;
	}
	
	public int getBeforeIdx() {
		return beforeIdx;
	}
	
	public void setBeforeIdx(int beforeIdx) {
		this.beforeIdx = beforeIdx;
	}
	
	public String getBefore() {
		return before;
	}
	
	public void setBefore(String before) {
		this.before = before;
	}*/

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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
		return "Pagenation [sKey=" + sKey + ", pageIndex=" + pageIndex + ", pageUnit=" + pageUnit + ", pageSize=" + pageSize + ", firstIndex=" + firstIndex + ", lastIndex=" + lastIndex + ", recordCountPerPage=" + recordCountPerPage + ", page=" + page + "]";
	}

}
