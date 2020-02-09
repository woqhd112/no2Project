package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_Common_Dao;
import Project_LMS_Model.LMS_Emp_Dto;

@WebServlet("/LMS/Govern/inforup.html")
public class GovernInforupController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		LMS_Common_Dao dao = new LMS_Common_Dao();

		int empnum=Integer.parseInt(req.getParameter("empnum"));
		
		System.out.println("사원번호: "+empnum);
		
		try {
			LMS_Emp_Dto bean = dao.inforSelectOne(empnum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("행정팀 정보수정 화면출력 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		req.getRequestDispatcher("inforup.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		int empnum=Integer.parseInt(req.getParameter("empnum"));
		String emppw = req.getParameter("emppw").trim();
		String empemail = req.getParameter("empemail").trim();
		String empphone = req.getParameter("empphone").trim();
		String empaddr = req.getParameter("empaddr").trim();
		
		System.out.println("넘어온 파라미터 값 : "+empnum+","+emppw+","+empemail+","+empphone+","+empaddr);
		
		LMS_Common_Dao dao = new LMS_Common_Dao();
		
		PrintWriter out=resp.getWriter();
		int result = 0;
		
		try {
			result = dao.inforUpdate(empnum, emppw, empemail, empphone, empaddr);
		} catch (SQLException e) {
			System.out.println("행정팀 정보수정 수정처리 에러");
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

