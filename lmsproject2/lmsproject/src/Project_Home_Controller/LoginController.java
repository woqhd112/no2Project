package Project_Home_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_Home_Model.Home_AttendTime_Dto;
import Project_Home_Model.Home_Student_Dao;
import Project_Home_Model.Home_Student_Dto;

@WebServlet("/Home/login.html")
public class LoginController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String stuid=req.getParameter("id");
		String stupw=req.getParameter("pw");
		System.out.println(stuid+","+stupw);
		Home_Student_Dao dao=new Home_Student_Dao();
		Object[] obj=null;
		PrintWriter out=resp.getWriter();
		try {
			obj=dao.login(stuid, stupw);
		} catch (SQLException e) {
			System.out.println("로그인 정보체크 에러");
			out.print("fail");
			out.flush();
			out.close();
		}
		Home_Student_Dto bean1=(Home_Student_Dto)obj[0];
		Home_AttendTime_Dto bean2=(Home_AttendTime_Dto)obj[1];
		if(bean1.getLogin()>0){
			HttpSession session=req.getSession();
			
			session.setAttribute("login", bean1);
			session.setAttribute("check", bean2);
			out.println(1);
			out.flush();
			out.close();
		}else{
			out.println(0);
			out.flush();
			out.close();
		}
	}
}
