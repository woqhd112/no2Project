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
		
		System.out.println("컨트롤러 접근");
		Common_dao dao=new Common_dao();
		TimeCheck check=new TimeCheck();
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		int diffDays=0;
		System.out.println("객체생성 성공");
		
		//파라미터 받아오는곳
		String teachername=req.getParameter("name");
		String startdate=req.getParameter("start");
		String enddate=req.getParameter("end");
		System.out.println("받아온 파라미터값 ? "+teachername+","+startdate+","+enddate);
		
		//강좌진행일 받아서 그에맞는 총 강좌일 계산하는곳
		diffDays=check.subAttendTime(startdate,enddate);
		
		
		//학생들의 각각의 출결상태를 리턴받는곳 -list타입에 LMS_AttendInfo_Dto와 Home_AttendTime_Dto객체 내장
		try {
			list=dao.attendTimeSelectAll(teachername);
			System.out.println("리스트값 받아오기 성공");
		} catch (SQLException e) {
			System.out.print("출석마감 처리-학생 출결상태리턴 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		
		//각 강사팀의 학생들 명수 구하는곳
		int tableRow=0;
		try {
			tableRow=dao.tableRowCheckReturn(teachername);
			System.out.println("테이블 갯수 받아오기 성공");
		} catch (SQLException e) {
			System.out.println("출석마감 처리-테이블갯수 에러");
			resp.sendRedirect("../lmsLogin.html");
			req.getSession().setAttribute("lmslogin", null);
			return;
		}
		
		int[] result1=new int[tableRow];
		int[] result2=new int[tableRow];
		
		//모든 학생정보 출석처리
		PrintWriter out=resp.getWriter();
		try{
			for(int i=0;i<tableRow;i++){
				Object[] obj=list.get(i);
				System.out.println("반복문 접근 성공");
				
				//인트배열[attendinfo의 정보를 attendtime에있는 attendstat기준으로 계산]
				int[] checking=check.attendInfoReturn(obj,diffDays);
				int stunum=checking[0];
				int ontime=checking[1];
				int late=checking[2];
				int absent=checking[3];
				int attendpct=checking[4];
				int checkpct=checking[5];
				System.out.println("받아온 attendinfo값 : "+stunum+","+ontime+","+late+","+absent+","+attendpct+","+checkpct);
				System.out.println("attendinfo값 처리 성공");
				
				result1[i]=dao.attendInfoUpdate(stunum, ontime, late, absent, checkpct, attendpct);
				System.out.println("attendinfo 업데이트 성공");
				result2[i]=dao.attendTimeUpdate(stunum);
				System.out.println("attendtime 업데이트 성공");
				Thread.sleep(300);
			}
		}catch(Exception e){
			out.print("Exception");
			out.flush();
			out.close();
			return;
		}
		
		if(result1.length==tableRow&&result2.length==tableRow){
			System.out.println("출석마감 성공");
			out.print("ok");
			out.flush();
			out.close();
		}else{
			System.out.println("출석마감 실패");
			out.print("fail");
			out.flush();
			out.close();
		}
	}
}
