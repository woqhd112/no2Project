package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Exam_Dto;
import Project_LMS_Model.LMS_TeacherTeam_Dao;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Teacher/examWrite.html")
public class ExamWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		Common_dao com=new Common_dao();
		
		String empname=req.getParameter("name");
		
		//강좌명 뽑는곳
		try {
			LMS_Class_Dto bean=com.teachernameReturn(empname);
			req.setAttribute("bean4", bean);
		} catch (SQLException e1) {
			System.out.println("강사팀 시험등록 화면출력-강좌명 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		//테이블의 로우개수 구하는곳
		int totalCount=0;	//로우갯수
		
		String tablename="notice";	//테이블이름
		
		try {
			totalCount=com.tableRowReturn(tablename);
		} catch (SQLException e) {
			System.out.println("강사팀 시험등록 화면출력-테이블갯수 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
		}
		System.out.println("notice의 총 row갯수 : "+totalCount);
		
		
		//페이지
		int page=1;
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		Paging paging=new Paging();
		paging.setPage(page);
		paging.setTotalCount2(totalCount);
		System.out.println("현재 page : "+page);
		
		
		try {
			ArrayList<LMS_Exam_Dto> list=dao.examUpSelectAll(page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
		} catch (SQLException e) {
			System.out.println("강사팀 시험등록 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		
		req.getRequestDispatcher("examWrite.jsp").forward(req, resp);
	}
}
