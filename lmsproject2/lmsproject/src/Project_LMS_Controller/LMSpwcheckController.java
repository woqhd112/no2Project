package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;
import Project_LMS_Model.LMS_Common_Dao;
import Project_LMS_Model.LMS_Emp_Dto;

@WebServlet("/LMS/pwcheck.html")
public class LMSpwcheckController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getRequestDispatcher("pwcheck.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		LMS_Common_Dao dao=new LMS_Common_Dao();
		PrintWriter out=resp.getWriter();

		String empid=req.getParameter("id");
		String empphone=req.getParameter("num");
		String dept=req.getParameter("job");
		System.out.println("직원아이디="+empid+", 핸드폰번호="+empphone+", 부서="+dept);
		try {
			String bean=dao.checkpw(empid, empphone, dept);
			System.out.println(bean);
			String fuck="wow";
			if(bean!=null){
				out.print(bean);
				out.flush();
				out.close();
			}else{
				out.print(fuck);
				out.flush();
				out.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
