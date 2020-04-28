package orm.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlCommonDao {

	String resource = "orm/mybatis/Configuration.xml";
	
	public List<Map<String, Object>> getZDOList(){
		List<Map<String, Object>> zdoList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			zdoList = sqlSes.selectList("getZDOList");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return zdoList;
	}
	/****************************************************************
	 * @param pMap pMap.get("dong")
	 * @return List<Map<String,Object>>
	 * 업무설명 : 동이름을 입력하면 조건검색을 통하여 구간검색 처리하기
	 * 작성자 : 강감찬
	 * 2020년 04월 27일
	 ****************************************************************/
	public List<Map<String, Object>> dongList(Map<String,Object> pMap){
		List<Map<String, Object>> dList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			dList = sqlSes.selectList("dongList",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dList;
	}
	public List<Map<String, Object>> getSIGUList(Map<String,Object> pMap){
		List<Map<String, Object>> siguList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			siguList = sqlSes.selectList("getSIGUList",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return siguList;
	}
	public List<Map<String, Object>> getDONGList(Map<String,Object> pMap){
		List<Map<String, Object>> dongList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			dongList = sqlSes.selectList("getDONGList",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dongList;
	}
	public List<Map<String, Object>> getZIPList(Map<String,Object> pMap){
		List<Map<String, Object>> zipList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			zipList = sqlSes.selectList("getZIPList",pMap);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return zipList;
	}
	public static void main(String[] args) {
		SqlCommonDao s = new SqlCommonDao();
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("zdo","서울" );
		pMap.put("sigu","강서구");
		pMap.put("dong","화곡");
		//System.out.println(s.getZDOList());
		//System.out.println(s.getSIGUList(pMap));
		//System.out.println(s.getDONGList(pMap));
		//System.out.println(s.getZIPList(pMap));
		System.out.println(s.dongList(pMap));
				}
}
