package orm.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class P2_BookDao {

	public List<Map<String, Object>> bookList(Map<String, Object> pMap){
		List<Map<String, Object>> bList = null;
		String resource = "orm/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			bList = sqlSes.selectList("bookList", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return bList;
		
	}
	public static void main(String[] args) {
		System.out.println(new P2_BookDao().bookList(null));
	}
}
