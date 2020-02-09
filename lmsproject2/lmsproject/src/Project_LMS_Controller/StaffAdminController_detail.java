package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_Emp_Dto;
import Project_LMS_Model.LMS_GovernTeam_Dao;

@WebServlet("/LMS/Govern/staffAdmin_detail.html")
public class StaffAdminController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		String empid=req.getParameter("empid");
		
		try {
			LMS_Emp_Dto bean=dao.staffAdminSelectOne(empid);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("행정팀 교직원관리 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("staffAdmin_detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		
		String empid=req.getParameter("empid");
		String empphone=req.getParameter("empphone");
		String dept=req.getParameter("dept");
		String empemail=req.getParameter("empemail");
		System.out.println(empid+","+empphone+","+dept+","+empemail);
		
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.staffAdminUpdate(empid, empphone, dept, empemail);
		} catch (SQLException e) {
			System.out.println("행정팀 교직원관리 수정처리 에러");
			out.print("fail");
			out.flush();
			out.close();
		}
		System.out.println(result);
		if(result>0){
			System.out.println(result);
			out.print(result);
			out.flush();
			out.close();
		}
		
	}
}
