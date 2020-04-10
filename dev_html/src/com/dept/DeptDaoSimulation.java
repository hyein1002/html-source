package com.dept;

public class DeptDaoSimulation {

	public static void main(String[] args) {
		DeptDao ddao = new DeptDao();
		System.out.println(ddao.deptList().size());
	}

}
