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

import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

import Project_Utils.Common_dao;
import Project_Utils.TimeCheck;

@WebServlet("/LMS/Teacher/checkEnd.html")
public class CheckEndController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("��Ʈ�ѷ� ����");
		Common_dao dao=new Common_dao();
		TimeCheck check=new TimeCheck();
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		int diffDays=0;
		System.out.println("��ü���� ����");
		
		//�Ķ���� �޾ƿ��°�
		String teachername=req.getParameter("name");
		String startdate=req.getParameter("start");
		String enddate=req.getParameter("end");
		System.out.println("�޾ƿ� �Ķ���Ͱ� ? "+teachername+","+startdate+","+enddate);
		
		//���������� �޾Ƽ� �׿��´� �� ������ ����ϴ°�
		diffDays=check.subAttendTime(startdate,enddate);
		
		
		//�л����� ������ �����¸� ���Ϲ޴°� -listŸ�Կ� LMS_AttendInfo_Dto�� Home_AttendTime_Dto��ü ����
		try {
			list=dao.attendTimeSelectAll(teachername);
			System.out.println("����Ʈ�� �޾ƿ��� ����");
		} catch (SQLException e) {
			System.out.print("�⼮���� ó��-�л� �����¸��� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		
		//�� �������� �л��� ��� ���ϴ°�
		int tableRow=0;
		try {
			tableRow=dao.tableRowCheckReturn(teachername);
			System.out.println("���̺� ���� �޾ƿ��� ����");
		} catch (SQLException e) {
			System.out.println("�⼮���� ó��-���̺��� ����");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		int[] result1=new int[tableRow];
		int[] result2=new int[tableRow];
		
		//��� �л����� �⼮ó��
		PrintWriter out=resp.getWriter();
		try{
			for(int i=0;i<tableRow;i++){
				Object[] obj=list.get(i);
				System.out.println("�ݺ��� ���� ����");
				
				//��Ʈ�迭[attendinfo�� ������ attendtime���ִ� attendstat�������� ���]
				int[] checking=check.attendInfoReturn(obj,diffDays);
				int stunum=checking[0];
				int ontime=checking[1];
				int late=checking[2];
				int absent=checking[3];
				int attendpct=checking[4];
				int checkpct=checking[5];
				System.out.println("�޾ƿ� attendinfo�� : "+stunum+","+ontime+","+late+","+absent+","+attendpct+","+checkpct);
				System.out.println("attendinfo�� ó�� ����");
				
				result1[i]=dao.attendInfoUpdate(stunum, ontime, late, absent, checkpct, attendpct);
				System.out.println("attendinfo ������Ʈ ����");
				result2[i]=dao.attendTimeUpdate(stunum);
				System.out.println("attendtime ������Ʈ ����");
				Thread.sleep(300);
			}
		}catch(Exception e){
			out.print("Exception");
			out.flush();
			out.close();
			return;
		}
		
		if(result1.length==tableRow&&result2.length==tableRow){
			System.out.println("�⼮���� ����");
			out.print("ok");
			out.flush();
			out.close();
		}else{
			System.out.println("�⼮���� ����");
			out.print("fail");
			out.flush();
			out.close();
		}
	}
}
