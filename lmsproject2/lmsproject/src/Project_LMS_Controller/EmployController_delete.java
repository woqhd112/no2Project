package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_EmployTeam_Dao;

@WebServlet("/LMS/Employ/employ_delete.html")
public class EmployController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int infonum = Integer.parseInt(req.getParameter("infonum"));
		
		System.out.println(infonum);
		
		LMS_EmployTeam_Dao dao = new LMS_EmployTeam_Dao();
		int result = 0;
		PrintWriter out = resp.getWriter();
		try {	
			result = dao.employDelete(infonum);
		} catch (SQLException e){
			System.out.println("취업공고 삭제처리 에러");
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
