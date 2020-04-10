package project.restaurant;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class RestaurantView extends JFrame implements ActionListener{

	//선언부		
	JPanel				jp_north	= new JPanel();
	JButton				jbtn_ins	= new JButton("입력");
	JButton				jbtn_upd	= new JButton("수정");
	JButton				jbtn_del	= new JButton("삭제");
	JButton				jbtn_sel	= new JButton("조회");
	JPanel				jp_center	= new JPanel();
	String				cols[]		= {"식당이름","주소","전화번호"};
	String				datas[][]	= new String[0][3];
	DefaultTableModel	dtm_res		= new DefaultTableModel(datas,cols);
	JTable				jt_res		= new JTable(dtm_res);
	JScrollPane			jsp_res		= new JScrollPane(jt_res);
	RestaurantDao	rd = new RestaurantDao();
	RestINSView	riv	= null;


	//생성자
	public RestaurantView() {
		refreshData();
		initDisplay();
	}
	//화면처리부
	public void initDisplay() {
		jbtn_del.addActionListener(this);
		jbtn_ins.addActionListener(this);
		jbtn_sel.addActionListener(this);
		jbtn_upd.addActionListener(this);
		jp_north.setLayout(new FlowLayout(FlowLayout.LEFT));
		jp_north.add(jbtn_ins);
		jp_north.add(jbtn_upd);
		jp_north.add(jbtn_del);
		jp_north.add(jbtn_sel);
		jp_center.setLayout(new BorderLayout());
		jp_center.add("Center",jsp_res);
		this.add("Center",jp_center);
		this.add("North",jp_north);
		this.setTitle("골목식당 정보 Ver1.0");
		this.setSize(800,550);
		this.setVisible(true);
	}
	
	public void refreshData() {
		List<Map<String, Object>> mrList = rd.restSEL();
		for(int i =0;i<mrList.size();i++) {
			Vector v = new Vector();
			v.add(mrList.get(i).get("res_name"));
			v.add(mrList.get(i).get("res_addr"));
			v.add(mrList.get(i).get("res_tel"));
			dtm_res.addRow(v);
		}

	}
	public void selData(int res_num) {
		List<Map<String, Object>> rList = rd.restSEL();
		riv.jtf_name.setText((String)rList.get(res_num).get("res_name"));
	}
	//메인메소드
	public static void main(String[] args) {
		new RestaurantView();

		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj==jbtn_ins) {
			riv.isOk = true;
		}
		else if(obj==jbtn_del) {
			riv.isOk = true;

		}
		else if(obj==jbtn_sel) {
			riv.setVisible(true);
			selData(jt_res.getSelectedRow());
			System.out.println(jt_res.getSelectedRow());
			
		}
		else if(obj==jbtn_upd) {
			riv.isOk = true;

			
		}
	}

}
