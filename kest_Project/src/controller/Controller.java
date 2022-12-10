package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.SalesListCommand;
import command.SignupCommand;
import command.StudentCommand;
import command.teacherCommand;

// 모든 url 들은 webServlet에서 받아내겠다는 뜻
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet메소드를 탈 시에 console에 기록하기 위해 넣었다.(디버깅위해)
		System.out.println("doGet() ..");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doPost메소드를 탈 시에 console에 기록하기 위해 넣었다.(디버깅위해)
		System.out.println("doPost() ..");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo() ..");

		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		Command command = null;

		// 위의 세 줄은 http://localhost:8282/jsp_mvc_board/list.do 에서 list.do를 꺼내기 위한 코드들.
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println("경로 확인:" + uri + ":" + conPath + ":" + com);


		if (com.equals("/TeacherInfo.do")) {
			System.out.println("디버깅문구");
			command = new teacherCommand();
			command.execute(request, response);
			viewPage = "TeacherInfo.jsp";

		} else if(com.equals("/StudentInfo.do")) {
			System.out.println("디버깅문구");
			command = new StudentCommand();
			command.execute(request, response);
			viewPage = "StudentInfo.jsp";
			
		}else if(com.equals("/SignUp.do")) {
			System.out.println("디버깅문구");
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "SignUp.jsp";
			
		}else if(com.equals("/SalesList.do")) {
			System.out.println("디버깅문구");
			command = new SalesListCommand();
			command.execute(request, response);
			viewPage = "SalesList.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

}
