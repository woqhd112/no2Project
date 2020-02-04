package Project_Home_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_Home_Model.Home_Student_Dao;
import Project_Home_Model.Home_Student_Dto;

@WebServlet("/Home/MyPage/inforup.html")
public class InforupController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Home_Student_Dao dao=new Home_Student_Dao();
		HttpSession session=req.getSession();
		Home_Student_Dto login=(Home_Student_Dto)session.getAttribute("login");
		int stunum=login.getStunum();
		System.out.println("학번 : "+stunum);
		try {
			login=dao.inforSelectOne(stunum);
			req.setAttribute("bean", login);
		} catch (SQLException e) {
			System.out.println("회원정보수정 화면출력 에러");
			resp.sendRedirect("../login.html");
			req.getSession().setAttribute("login", null);
			return;
		}
		
		req.getRequestDispatcher("inforup.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int stunum=Integer.parseInt(req.getParameter("stunum"));
		String stupw=req.getParameter("stupw");
		String stuphone=req.getParameter("stuphone");
		String stuaddr=req.getParameter("stuaddr");
		
		System.out.println("학번 : "+stunum);
		System.out.println("비밀번호 : "+stupw);
		System.out.println("전화번호 : "+stuphone);
		System.out.println("주소 : "+stuaddr);
		
		Home_Student_Dao dao=new Home_Student_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.inforUpdate(stunum, stupw, stuphone, stuaddr);
		} catch (SQLException e) {
			System.out.println("회원정보수정 수정작업 에러");
			out.print("fail");
			out.flush();
			out.close();
		}
		if(result>0){
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
