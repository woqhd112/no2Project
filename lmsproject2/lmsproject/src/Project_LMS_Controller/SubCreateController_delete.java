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

@WebServlet("/LMS/Govern/subCreate_delete.html")
public class SubCreateController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_GovernTeam_Dao dao=new LMS_GovernTeam_Dao();
		
		int classnum=Integer.parseInt(req.getParameter("num"));
		
		System.out.println("넘어온 강좌번호 : "+classnum);
		
		PrintWriter out=resp.getWriter();
		int result=0;
		int result1=0;
		try {
			result=dao.subCreateDelete(classnum);
		} catch (SQLException e) {
			out.print("fail");
			out.flush();
			out.close();
		}
		if(result>0&&result1>0){
			out.print("ok");
			out.flush();
			out.close();
		}else if(result>0&&result1==0){
			out.print("ok");
			out.flush();
			out.close();
		}else{
			out.print("fail1");
			out.flush();
			out.close();
		}
	}
}
