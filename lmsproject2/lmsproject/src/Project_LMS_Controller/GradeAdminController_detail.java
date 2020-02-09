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
import Project_LMS_Model.LMS_TeacherTeam_Dao;
import Project_Utils.Common_dao;

@WebServlet("/LMS/Teacher/gradeAdmin_detail.html")
public class GradeAdminController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int stunum=Integer.parseInt(req.getParameter("num"));
		String empname=req.getParameter("empname");
		System.out.println("넘어온 파라미터 : "+stunum+","+empname);
		
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		Common_dao com=new Common_dao();
		
		//강좌명 뽑는곳
		try {
			LMS_Class_Dto bean=com.teachernameReturn(empname);
			req.setAttribute("bean4", bean);
		} catch (SQLException e1) {
			System.out.println("강사팀 성적관리 상세페이지 출력-강좌명 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		try {
			Object[] obj=dao.gradeAdminSelectOne(stunum);
			req.setAttribute("bean", obj);
		} catch (SQLException e) {
			System.out.println("강사팀 성적관리 상세페이지 출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("gradeAdmin_detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int stunum=Integer.parseInt(req.getParameter("num"));
		int first=Integer.parseInt(req.getParameter("first"));
		int second=Integer.parseInt(req.getParameter("second"));
		int third=Integer.parseInt(req.getParameter("third"));
		
		System.out.println("넘어온 점수들 : "+stunum+","+first+","+second+","+third);
		
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.gradeAdminInsert(stunum, first, second, third);
		} catch (SQLException e) {
			System.out.println("강사팀 상세페이지 성적관리 수정 에러");
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
