package Project_LMS_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;
import Project_LMS_Model.LMS_GovernTeam_Dao;

@WebServlet("/LMS/Govern/empDuplicate.html")
public class EmpController_duplicate extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String empid=req.getParameter("id");
		int check=0;
		LMS_GovernTeam_Dao dao= new LMS_GovernTeam_Dao();
		PrintWriter out=resp.getWriter();
		try {
			check=dao.empDuplicate(empid);
		} catch (SQLException e) {
			System.out.println("행정팀 교직원 아이디 중복처리 에러");
			out.print("fail");
			out.flush();
			out.close();
		}
		//req.setAttribute("check", check);
		System.out.println(check);
		out.print(check);
		out.flush();
		out.close();
	}
}
