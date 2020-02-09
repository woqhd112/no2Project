package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_TeacherTeam_Dao;

@WebServlet("/LMS/Teacher/examWrite_delete.html")
public class ExamWriteController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int examnum=Integer.parseInt(req.getParameter("num"));
		
		System.out.println("시험번호 : "+examnum);
		
		LMS_TeacherTeam_Dao dao=new LMS_TeacherTeam_Dao();
		PrintWriter out=resp.getWriter();
		int result=0;
		try {
			result=dao.examUpDelete(examnum);
		} catch (SQLException e) {
			System.out.println("강사팀 시험등록 삭제처리 에러");
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
