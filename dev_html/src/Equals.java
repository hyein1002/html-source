
public class Equals {

	public static void main(String[] args) {
		String s ="안녕";
		String s1 = new String("안녕");
		boolean a = (s==s1);//주소번지가 같니?
		boolean b = s.equals(s1);//그 주소번지가 가리키는 값이 같은겅야?
		System.out.println(a+","+b);
		if(s==s1) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}
		if(s.equals(s1)) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}
				
	}

}
