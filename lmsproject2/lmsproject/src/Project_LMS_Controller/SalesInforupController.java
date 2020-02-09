package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_LMS_Model.LMS_Common_Dao;
import Project_LMS_Model.LMS_Emp_Dto;

@WebServlet("/LMS/Sales/inforup.html")
public class SalesInforupController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_Common_Dao dao=new LMS_Common_Dao();
		int empnum=Integer.parseInt(req.getParameter("empnum"));
		
		try {
			LMS_Emp_Dto bean=dao.inforSelectOne(empnum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("영업팀 정보수정 화면출력 에러");
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
		String emppw=req.getParameter("emppw").trim();
		String empemail=req.getParameter("empemail").trim();
		String empphone=req.getParameter("empphone").trim();
		String empaddr=req.getParameter("empaddr").trim();
		
		System.out.println("넘어온 파라미터 값 : "+empnum+","+emppw+","+empemail+","+empphone+","+empaddr);
		
		LMS_Common_Dao dao=new LMS_Common_Dao();
		int result=0;
		PrintWriter out=resp.getWriter();
		try {
			result=dao.inforUpdate(empnum, emppw, empemail, empphone, empaddr);
		} catch (SQLException e) {
			System.out.println("영업팀 정보수정 수정처리 에러");
			out.print("fail1");
			out.flush();
			out.close();
		}
		System.out.println(result);
		if(result>0){
			out.print(1);
			out.flush();
			out.close();
		}else{
			out.print("fail");
			out.flush();
			out.close();
		}
		
	}
}
