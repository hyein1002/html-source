package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapDeptDao {
	String resouce = "orm/mybatis/Configuration.xml";
	public List<Map<String, Object>> deptList(Map<String, Object> pMap){
		List<Map<String, Object>> dList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resouce);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			dList = sqlSes.selectList("deptList",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dList;
	}
	public static void main(String[] args) {
		System.out.println(new SqlMapDeptDao().deptList(null));
	}
}
