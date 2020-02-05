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

import Project_LMS_Model.LMS_Emp_Dto;
import Project_LMS_Model.LMS_GovernTeam_Dao;
import Project_Utils.Common_dao;

@WebServlet("/LMS/Govern/subCreate_insert.html")
public class SubCreateController_insert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Common_dao com=new Common_dao();
		
		//강사명 출력
		try {
			ArrayList<LMS_Emp_Dto> list=com.teacherNameReturn();
			req.setAttribute("alist", list);
		} catch (SQLException e1) {
			System.out.println("행정팀 강좌등록 화면출력-강사명출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("subCreate_insert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		Common_dao com=new Common_dao();
		
		String classname=req.getParameter("classname").trim();
		String teachername=req.getParameter("teachername").trim();
		String[] start=req.getParameter("start").split("-");
		String[] end=req.getParameter("end").split("-");
		
		String start1=start[0];
		String start2=start[1];
		String start3=start[2];
		String end1=end[0];
		String end2=end[1];
		String end3=end[2];
		
		String startdate=start1+"/"+start2+"/"+start3;
		String enddate=end1+"/"+end2+"/"+end3;
		
		
		System.out.println("넘어온 파라미터값 : "+classname+","+teachername+","+startdate+","+enddate);
		String empname=null;
		PrintWriter out=resp.getWriter();
		try {
			empname=com.teachernameCheck(teachername);
		} catch (SQLException e1) {
			System.out.println("행정팀 강좌등록 등록처리 에러");
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
			int result=0;
			try {
				result=dao.subCreateInsert(classname, teachername, startdate, enddate);
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
