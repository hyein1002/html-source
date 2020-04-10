package project.restaurant;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

class RestaurantDaoTest {
	RestaurantDao	rd = new RestaurantDao();
	@Test
	void testProcRestList() {
		assertEquals(7, rd.procRestList().size());
		List<Map<String,Object>> rList = rd.procRestList();
		assertSame(rList, rd.procRestList());
	}

}
