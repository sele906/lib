package egovframework.example.admin.statics.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.admin.statics.dao.StatDAO;
import egovframework.example.admin.statics.service.StatService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("StatService")
public class StatServiceImpl implements StatService {

	@Resource(name = "StatDAO")
	private StatDAO statDao;

	@Override
	public void statInsert(Map<String, Object> map) throws Exception {
		statDao.statInsert(map);
	}

	@Override
	public List<EgovMap> loanStat() throws Exception {
		List<EgovMap> list = statDao.loanStat();
		return list;
	}

	@Override
	public List<EgovMap> returnStat() throws Exception {
		List<EgovMap> list = statDao.returnStat();
		return list;
	}

	@Override
	public List<EgovMap> userStat() throws Exception {
		List<EgovMap> list = statDao.userStat();
		return list;
	}

	@Override
	public List<EgovMap> adminStat() throws Exception {
		List<EgovMap> list = statDao.adminStat();
		return list;
	}

	@Override
	public List<EgovMap> bookStat() throws Exception {
		List<EgovMap> list = statDao.bookStat();
		return list;
	}

}
