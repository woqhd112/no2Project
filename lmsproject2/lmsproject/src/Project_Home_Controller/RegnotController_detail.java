package Project_Home_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project_Home_Model.Home_Student_Dao;

@WebServlet("/Home/regnot_detail.html")
public class RegnotController_detail extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Home_Student_Dao dao=new Home_Student_Dao();
		int regnum=Integer.parseInt(req.getParameter("num"));
		int cnt=Integer.parseInt(req.getParameter("cnt"));
		int regcnt=cnt+1;
		try {
			Object[] obj=dao.regnotSelectOne(regnum,regcnt);
			req.setAttribute("bean", obj);
		} catch (SQLException e) {
			System.out.println("학생 모집공고 상세페이지 화면처리 에러");
			resp.sendRedirect("..index.html");
			return;
		}
		req.getRequestDispatcher("regnot_detail.jsp").forward(req, resp);
	}
}
