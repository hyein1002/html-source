package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class BookDao {
	Logger logger = Logger.getLogger(BookDao.class);
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	/*****************************************************************
	 * 도서정보 조회하기 구현
	 * @param pMap - 사용자가 자동완성 textbox에 입력한 도서제목 정보
	 * @return - 사용자가 입력한 도서정보를 선분조건(Like패턴)으로 검색하여 결과 반환
	 *****************************************************************/
	public List<Map<String,Object>> bookList(Map<String,Object> pMap){
		//선언만 되어있으므로 검색결과가 존재하지 않을 경우 NullPointerException의 원인이 될 수도있다.
		//가급적이면 에러를 피해 갈 수 있도록 코딩을 전개한다.
		//=null이아닌 ArrayList로 인스턴스화해줄수있다.
		List<Map<String,Object>> bList = new ArrayList<Map<String,Object>>();
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			bList = sqlSes.selectList("bookList",pMap);
			logger.info("bList.size()===>"+bList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bList; 
	}
	
	public static void main(String[] args) {
		System.out.println(new BookDao().bookList(null));
	}
}
