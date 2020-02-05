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
			System.out.println("�⼮üũ ȭ����� ����");
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
		
		//�Ķ���� ó��
		String data=req.getParameter("data");
		System.out.println("�Ѿ�� �Ķ���� : "+data);
		
		String[] check1=data.split(",");
		System.out.println("�Ķ���� ���ø� : "+check1[0]+" and "+check1[1]);
		
		String check=check1[1].trim();
		System.out.println("check ���� : "+check);
		int stunum=Integer.parseInt(check1[0]);
		System.out.println("�й� : "+stunum);
		
		
		//����ð� �̴°�
		TimeCheck tc=new TimeCheck();
		String time=tc.getTime();
		System.out.println(time);
		
		//������ üũ�ϴ°�
		int attendstat=0;
		attendstat=tc.attendTimeReturn();
		
		Home_Student_Dao dao=new Home_Student_Dao();
		Home_AttendTime_Dto bean=null;
		PrintWriter out=resp.getWriter();
		HttpSession session=req.getSession();
		//�Խ�ó��
		if(check.equals("arrive")){
			try {
				bean=dao.checkInsertArrive(stunum,time,attendstat);
				session.setAttribute("check", bean);
				System.out.println("�ԽǿϷ�");
			} catch (SQLException e) {
				out.print("fail");
				out.flush();
				out.close();
			}
		//���ó��
		}else if(check.equals("leave")){
			try {
				bean=dao.checkInsertLeave(stunum, time);
				session.setAttribute("check", bean);
				
				System.out.println("��ǿϷ�");
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
