package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Common_Dao;
import Project_LMS_Model.LMS_Emp_Dto;
import Project_Utils.Common_dao;

@WebServlet("/LMS/Teacher/inforup.html")
public class TeacherInforupController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		LMS_Common_Dao dao=new LMS_Common_Dao();
		Common_dao com=new Common_dao();
		String empname=req.getParameter("name");
		
		int empnum=Integer.parseInt(req.getParameter("empnum"));
		System.out.println("넘어온 직원번호 : "+empnum);
		
		//강좌명 뽑는곳
		try {
			LMS_Class_Dto bean=com.teachernameReturn(empname);
			
			req.setAttribute("bean4", bean);
		} catch (SQLException e1) {
			System.out.println("강사팀 정보수정 화면출력-강좌명출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		try {
			LMS_Emp_Dto bean=dao.inforSelectOne(empnum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("강사팀 정보수정 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("inforup.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int empnum=Integer.parseInt(req.getParameter("empnum"));
		String emppw=req.getParameter("emppw");
		String empemail=req.getParameter("empemail");
		String empphone=req.getParameter("empphone");
		String empaddr=req.getParameter("empaddr");
		
		System.out.println("넘어온 파라미터 값 : "+empnum+","+emppw+","+empemail+","+empphone+","+empaddr);
		
		LMS_Common_Dao dao=new LMS_Common_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.inforUpdate(empnum, emppw, empemail, empphone, empaddr);
		} catch (SQLException e) {
			System.out.println("강사팀 정보수정 수정처리 에러");
			out.print("fail1");
			out.flush();
			out.close();
		}
		if(result>0){
			out.print("ok");
			out.flush();
			out.close();
		}else{
			out.print("fail");
			out.flush();
			out.close();
		}
		
	}
}
