package Project_Home_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_Home_Model.Home_AttendTime_Dto;
import Project_Home_Model.Home_Student_Dao;
import Project_Home_Model.Home_Student_Dto;
import Project_Utils.TimeCheck;

@WebServlet("/Home/MyPage/check.html")
public class CheckController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Home_Student_Dao dao=new Home_Student_Dao();
		HttpSession session=req.getSession();
		Home_Student_Dto login=(Home_Student_Dto)session.getAttribute("login");
		int stunum=login.getStunum();
		
		try {
			Home_AttendTime_Dto bean=dao.checkSelectOne(stunum);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			System.out.println("출석체크 화면출력 에러");
			resp.sendRedirect("../login.html");
			session.setAttribute("login", null);
			return;
		}
		req.getRequestDispatcher("check.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//파라미터 처리
		String data=req.getParameter("data");
		System.out.println("넘어온 파라미터 : "+data);
		
		String[] check1=data.split(",");
		System.out.println("파라미터 스플릿 : "+check1[0]+" and "+check1[1]);
		
		String check=check1[1].trim();
		System.out.println("check 상태 : "+check);
		int stunum=Integer.parseInt(check1[0]);
		System.out.println("학번 : "+stunum);
		
		
		//현재시간 뽑는곳
		TimeCheck tc=new TimeCheck();
		String time=tc.getTime();
		System.out.println(time);
		
		//출결상태 체크하는곳
		int attendstat=0;
		attendstat=tc.attendTimeReturn();
		
		Home_Student_Dao dao=new Home_Student_Dao();
		Home_AttendTime_Dto bean=null;
		PrintWriter out=resp.getWriter();
		HttpSession session=req.getSession();
		//입실처리
		if(check.equals("arrive")){
			try {
				bean=dao.checkInsertArrive(stunum,time,attendstat);
				session.setAttribute("check", bean);
				System.out.println("입실완료");
			} catch (SQLException e) {
				out.print("fail");
				out.flush();
				out.close();
			}
		//퇴실처리
		}else if(check.equals("leave")){
			try {
				bean=dao.checkInsertLeave(stunum, time);
				session.setAttribute("check", bean);
				
				System.out.println("퇴실완료");
			} catch (SQLException e) {
				out.print("fail");
				out.flush();
				out.close();
			}
		}
		out.print("ok");
		out.flush();
		out.close();
	}
	
}
