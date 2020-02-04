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
import javax.websocket.SendResult;

import Project_LMS_Model.LMS_Common_Dao;
import Project_LMS_Model.LMS_Emp_Dto;

@WebServlet("/LMS/lmsLogin.html")
public class LMSLoginController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("lmsLogin.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		LMS_Common_Dao dao=new LMS_Common_Dao();
		LMS_Emp_Dto bean=new LMS_Emp_Dto();
		String empid=req.getParameter("id");
		String emppw=req.getParameter("pw");
		System.out.println("아이디,패스워드="+empid+","+emppw);
		try {
			bean=dao.lmsLogin(empid, emppw);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("LMS 로그인처리 에러");
		}
		if(bean.getLogin()>0){
			HttpSession session=req.getSession();
			session.setAttribute("lmslogin", bean);
			System.out.println("로그인 성공");
			System.out.println("dept : "+bean.getDept());
			if(bean.getDept().equals("영업팀")){
				resp.sendRedirect("Sales/salesTeam.html");
			}else if(bean.getDept().equals("회계팀")){
				resp.sendRedirect("Account/accountTeam.html");
			}else if(bean.getDept().equals("행정팀")){
				resp.sendRedirect("Govern/staffAdmin.html");
			}else if(bean.getDept().equals("취업팀")){
				resp.sendRedirect("Employ/employTeam.html");
			}else if(bean.getDept().equals("강사팀")){
				resp.sendRedirect("Teacher/teacherTeam.html");
			}else{
				resp.sendRedirect("lmsLogin.html");
			}
		}else{
			resp.sendRedirect("lmsLogin.html");
		}
	}
}
