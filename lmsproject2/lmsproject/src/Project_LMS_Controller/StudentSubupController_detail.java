package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dto;
import Project_LMS_Model.LMS_Class_Dto;
import Project_LMS_Model.LMS_SalesTeam_Dao;
import Project_Utils.Common_dao;

@WebServlet("/LMS/Sales/studentSubUp_detail.html")
public class StudentSubupController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int stunum=Integer.parseInt(req.getParameter("num"));
		
		System.out.println("�Ѿ�� �Ķ���Ͱ� : "+stunum);
		
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		Common_dao com=new Common_dao();
		try {
			//�������� ���
			Home_Student_Dto bean=dao.studentSubUpSelectOne(stunum);
			req.setAttribute("bean", bean);
			
			//������ư�������� ���¸�� ���
			ArrayList<Object[]> list=com.classNameStudentSubUp();
			req.setAttribute("alist", list);
		} catch (SQLException e) {
			System.out.println("������ �л�������� �������� ȭ�����-���¸���,ȭ�� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		
		req.getRequestDispatcher("studentSubUp_detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int stunum=Integer.parseInt(req.getParameter("num"));
		String[] class1=req.getParameter("classname").split("-");
		int classnum=Integer.parseInt(class1[0])+1;
		String[] class2=class1[1].split("����");
		String teachername=class2[0].trim();
		String[] class3=class2[1].trim().split("���ǽ�");
		int examnum=Integer.parseInt(class3[0])+1;
		String classname=class3[1];
		
		System.out.println("�Ѿ�� �Ķ���Ͱ� : "+stunum+","+classname+","+classnum+","+teachername+","+examnum);
		
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		int result=0;
		PrintWriter out=resp.getWriter();
		try {
			result=dao.studentSubUpUpdate(stunum, classname, classnum, teachername,examnum);
		} catch (SQLException e) {
			System.out.println("������ �л�������� �������� ����ó�� ����");
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
