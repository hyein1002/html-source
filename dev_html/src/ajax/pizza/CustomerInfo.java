package ajax.pizza;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CustomerInfo {
	public static void main(String[] args) {
		
		List<Map<String, Object>> cusList = new ArrayList<>();
		Map<String, Object> rMap = null;
		Gson g = new GsonBuilder().setPrettyPrinting().create();

		rMap = new HashMap<>();
		rMap.put("mem_name", "이순신");
		rMap.put("mem_addr", "서울시 마포구 공덕동");
		rMap.put("mem_tel", "025559990");
		cusList.add(rMap);
		
		rMap = new HashMap<>();
		rMap.put("mem_name", "김유신");
		rMap.put("mem_addr", "서울시 영등포구 당산동");
		rMap.put("mem_tel", "025559991");
		cusList.add(rMap);

		rMap = new HashMap<>();
		rMap.put("mem_name", "강감찬");
		rMap.put("mem_addr", "서울시 금천구 가산동");
		rMap.put("mem_tel", "025559992");
		cusList.add(rMap);

		String result = g.toJson(cusList);
		System.out.println(result);
		
	}
}
