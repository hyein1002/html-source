package project.restaurant;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class RestINSView extends JDialog implements ActionListener {
	JLabel 		jlb_name 	= new JLabel("식당명");
	JTextField 	jtf_name	= new JTextField(20);
	JLabel 		jlb_tel 	= new JLabel("전화번호");
	JTextField 	jtf_tel		= new JTextField(20);
	JLabel 		jlb_addr	= new JLabel("주소");
	JTextField 	jtf_addr	= new JTextField(60);
	JLabel 		jlb_photo	= new JLabel("사진");
	JTextField 	jtf_photo	= new JTextField(60);
	JLabel 		jlb_info 	= new JLabel("식당소개");
	JTextArea 	jta_info	= new JTextArea(8,25);
	JScrollPane	jsp_info	= new JScrollPane(jta_info);
	JLabel 		jlb_time	= new JLabel("영업시간");
	JTextField 	jtf_time	= new JTextField(60);
	JLabel 		jlb_lat		= new JLabel("위도");
	JTextField 	jtf_lat		= new JTextField(60);
	JLabel 		jlb_lng		= new JLabel("경도");
	JTextField 	jtf_lng		= new JTextField(60);
	JButton		jbtn_save 	= new JButton("저장");
	JButton		jbtn_close 	= new JButton("닫기");
	boolean		isOk		= false;
	
	public RestINSView() {
		initDisplay();
	}
	public void initDisplay() {
		this.setLayout(null);//기본은 borderlayout인데 좌표값으로 배치하기 위해서 null처리
		jbtn_save.addActionListener(this);
		jbtn_close.addActionListener(this);
		jlb_name.setBounds(20,20,100,20);
		jtf_name.setBounds(120,20,330,20);
		jlb_tel.setBounds(20,60,100,20);
		jtf_tel.setBounds(120,60,330,20);
		jlb_addr.setBounds(20,100,200,20);
		jtf_addr.setBounds(120,100,330,20);
		jlb_photo.setBounds(20,140,200,20);
		jtf_photo.setBounds(120,140,330,20);
		jlb_info.setBounds(20,180,100,20);
		jsp_info.setBounds(120,180,330,80);
		jlb_time.setBounds(20,280,100,20);
		jtf_time.setBounds(120,280,330,20);
		jlb_lat.setBounds(20,320,100,20);
		jtf_lat.setBounds(120,320,330,20);
		jlb_lng.setBounds(20,360,100,20);
		jtf_lng.setBounds(120,360,330,20);
		jbtn_save.setBounds(120,400,100,20);
		jbtn_close.setBounds(240,400,100,20);
		this.add(jlb_name);
		this.add(jtf_name);
		this.add(jlb_tel);
		this.add(jtf_tel);
		this.add(jlb_addr);
		this.add(jtf_addr);
		this.add(jlb_photo);
		this.add(jtf_photo);
		this.add(jlb_info);
		this.add(jsp_info);
		this.add(jlb_time);
		this.add(jtf_time);
		this.add(jlb_lat);
		this.add(jtf_lat);
		this.add(jlb_lng);
		this.add(jtf_lng);
		this.add(jbtn_save);
		this.add(jbtn_close);
		this.setSize(600,650);
		this.setVisible(false);
	}
	public static void main(String[] args) {
		new RestINSView();
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(jbtn_close==obj) {
			System.exit(0);
			
		}
		else if(jbtn_save==obj) {
			Map<String, Object> pMap = new HashMap<>();
			pMap.put("res_name", jtf_name.getText());
			pMap.put("res_tel", jtf_tel.getText());
			pMap.put("res_addr", jtf_addr.getText());
			pMap.put("res_photo", jtf_photo.getText());
			pMap.put("res_info", jta_info.getText());
			pMap.put("res_time", jtf_time.getText());
			pMap.put("lat", jtf_lat.getText());
			pMap.put("lng", jtf_lng.getText());
			int result = new RestaurantDao().restINS(pMap);
		}
	}

}
