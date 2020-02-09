package Project_LMS_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Emp_Dto;
import Project_LMS_Model.LMS_TeacherTeam_Dao;
import Project_Utils.Common_dao;
import Project_Utils.Paging;

@WebServlet("/LMS/Teacher/gradeAdmin.html")
public class GradeAdminController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		LMS_Emp_Dto login=(LMS_Emp_Dto)session.getAttribute("lmslogin");
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		Common_dao com=new Common_dao();
		
		String empname=login.getEmpname();
		
		//검색
		String search=req.getParameter("search");
		if(search==null)search="stuname";
		String keyword=req.getParameter("keyword");
		if(keyword==null)keyword="";
		String[] searching=new String[]{search,keyword};
		System.out.println("controller의 search,keyword : "+search+","+keyword);
		
		
		//테이블의 로우개수 구하는곳
		int totalCount=0;	//로우갯수
		String tablename="student";	//테이블이름
		try {
			if(keyword==""){
				totalCount=com.gradeAdminReturnNoSearch(empname);	//첫접근시 발동
			}else{
				totalCount=com.gradeAdminReturnSearch(empname, search);	//검색으로접근시 발동
			}
		} catch (SQLException e) {
			System.out.println("강사팀 성적관리 화면출력-테이블갯수 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
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
		
		
		//강좌명 뽑는곳
		try {
			LMS_Class_Dto bean=com.teachernameReturn(empname);
			req.setAttribute("bean", bean);
		} catch (SQLException e1) {
			System.out.println("강사팀 성적관리 화면출력-강좌명 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		try {
			ArrayList<Object[]> list=dao.gradeAdminSelectAll(empname,search,keyword,page);
			req.setAttribute("alist", list);
			req.setAttribute("paging", paging);
			req.setAttribute("searching", searching);
		} catch (SQLException e) {
			System.out.println("강사팀 성적관리 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("gradeAdmin.jsp").forward(req, resp);
	}
}
