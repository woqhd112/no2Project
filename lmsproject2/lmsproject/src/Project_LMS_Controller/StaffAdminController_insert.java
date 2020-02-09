package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_GovernTeam_Dao;


@WebServlet("/LMS/Govern/staffAdmin_insert.html")
public class StaffAdminController_insert extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("staffAdmin_insert.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String empid=req.getParameter("id");
		String emppw=req.getParameter("pw");
		String empname=req.getParameter("name");
		String empphone=req.getParameter("phone");
		String empemail=req.getParameter("mail");
		String dept=req.getParameter("job");
		String empaddr=req.getParameter("addr");
		System.out.println(empid+","+emppw+","+ empname+","+empphone+","+empemail+","+dept+","+empaddr);
		LMS_GovernTeam_Dao dao= new LMS_GovernTeam_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.staffAdminInsert(empid, emppw, empname, empphone, empemail, dept, empaddr);
		} catch (SQLException e) {
			System.out.println("행정팀 교직원관리 등록처리 에러");
			out.print("fail");
			out.flush();
			out.close();
			
		}
		if(result>0){
			out.print(result);
			out.flush();
			out.close();
		}
		
	}
}
