package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_GovernTeam_Dao;

@WebServlet("/LMS/Govern/studentAdmin_delete.html")
public class StudentAdminController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		
		int stunum=Integer.parseInt(req.getParameter("num"));
		
		System.out.println("넘어온 학번 : "+stunum);
		
		int result=0;
		PrintWriter out=resp.getWriter();
		try {
			result=dao.studentAdminDelete(stunum);
		} catch (SQLException e) {
			out.print("fail1");
			out.flush();
			out.close();
			return;
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
