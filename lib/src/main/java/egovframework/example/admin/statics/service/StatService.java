package egovframework.example.admin.statics.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface StatService {

	public void statInsert(Map<String, Object> map) throws Exception;

	public List<EgovMap> loanStat() throws Exception;

	public List<EgovMap> returnStat() throws Exception;

	public List<EgovMap> userStat() throws Exception;

	public List<EgovMap> adminStat() throws Exception;

	public List<EgovMap> bookStat() throws Exception;

}
