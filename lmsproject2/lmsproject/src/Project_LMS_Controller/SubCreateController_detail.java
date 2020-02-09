package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_Emp_Dto;
import Project_LMS_Model.LMS_GovernTeam_Dao;
import Project_Utils.Common_dao;

@WebServlet("/LMS/Govern/subCreate_detail.html")
public class SubCreateController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		Common_dao com=new Common_dao();
		
		int classnum=Integer.parseInt(req.getParameter("num"));
		System.out.println("넘어온 파라미터값 : "+classnum);
		
		//강사명 출력
		try {
			ArrayList<LMS_Emp_Dto> list=com.teacherNameReturn();
			req.setAttribute("alist", list);
		} catch (SQLException e1) {
			System.out.println("행정팀 강좌개설 상세페이지 화면출력-강사명출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		
		try {
			LMS_Class_Dto bean=dao.subCreateSelectOne(classnum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("행정팀 강좌개설 상세페이지 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("subCreate_detail.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		Common_dao com=new Common_dao();
		
		int classnum=Integer.parseInt(req.getParameter("num"));
		String classname=req.getParameter("sub").trim();
		String teachername=req.getParameter("teacher").trim();
		String startdate=req.getParameter("start").trim();
		String enddate=req.getParameter("end").trim();
		
		
		System.out.println("넘어온 파라미터값 : "+classnum+","+classname+","+teachername+","+startdate+","+enddate);
		PrintWriter out=resp.getWriter();
		int result=0;
		
		String empname=null;
		
		try {
			empname=com.teachernameCheck(teachername);
		} catch (SQLException e) {
			System.out.println("행정팀 강좌개설 상세페이지 수정처리 에러");
			out.print("fail2");
			out.flush();
			out.close();
		}
		if(empname!=null){
			if(empname.equals(teachername)){
				out.print("fail1");
				out.flush();
				out.close();
				return;
			}
		}else{
			try {
				result=dao.subCreateUpdate(classnum, classname, teachername, startdate, enddate);
			} catch (SQLException e) {
				e.printStackTrace();
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
}
