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

@WebServlet("/LMS/Govern/notice_delete.html")
public class NoticeController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int notnum = Integer.parseInt(req.getParameter("notnum"));
		
		System.out.println(notnum);
		
		LMS_GovernTeam_Dao dao = new LMS_GovernTeam_Dao();
		PrintWriter out = resp.getWriter();
		int result = 0;
		try {	
			result = dao.noticeDelete(notnum);
		} catch (SQLException e){
			System.out.println("������ �������� ����ó�� ����");
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
