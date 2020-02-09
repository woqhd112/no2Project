package Project_Home_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project_Home_Model.Home_Student_Dao;
import Project_Home_Model.Home_Student_Dto;

@WebServlet("/Home/MyPage/examView.html")
public class ExamViewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Home_Student_Dao dao=new Home_Student_Dao();
		HttpSession session=req.getSession();
		Home_Student_Dto bean=(Home_Student_Dto)session.getAttribute("login");
		int stunum=bean.getStunum();
		String teachername=bean.getTeachername();
		
		Object[] obj=null;
		try {
			obj=dao.examViewSelectOne(stunum, teachername);
			req.setAttribute("bean", obj);
		} catch (SQLException e) {
			System.out.println("시험조회 화면출력 에러");
			resp.sendRedirect("../login.html");
			req.getSession().setAttribute("login", null);
			return;
		}
		
		
		req.getRequestDispatcher("examView.jsp").forward(req, resp);
	}
}
