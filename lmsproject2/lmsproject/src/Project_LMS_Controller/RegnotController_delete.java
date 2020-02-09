package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_LMS_Model.LMS_SalesTeam_Dao;

@WebServlet("/LMS/Sales/regnot_delete.html")
public class RegnotController_delete extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		LMS_SalesTeam_Dao dao=new LMS_SalesTeam_Dao();
		int regnum=Integer.parseInt(req.getParameter("num"));
		System.out.println("해당 모집공고번호 : "+regnum);
		
		PrintWriter out=resp.getWriter();
		int result=0;
		
		try {
			result=dao.regnotDelete(regnum);
		} catch (SQLException e) {
			System.out.println("영업팀 모집공고 삭제처리 에러");
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
