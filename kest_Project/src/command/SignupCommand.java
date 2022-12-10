package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Dao;

public class SignupCommand implements Command {
	
	//자손이 구현하므로 interface의 메소드를 override한다.
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String regist_month = request.getParameter("regist_month");
		String c_no = request.getParameter("c_no");
		String class_area = request.getParameter("class_area");
		String tuition = request.getParameter("tuition");
		String teacher_code = request.getParameter("teacher_code");
		
		
		Dao dao = new Dao();
		//테이블에 있는 모든 데이터를 끌고 온다는 뜻
		dao.SignUp(regist_month, c_no, class_area, tuition, teacher_code);
	}
	
}
