package Project_LMS_Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LMS/Sales/regnot_down.html")
public class RegnotController_down extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String path=req.getRealPath("/upload");
		String filename=req.getParameter("file");
		String origin=req.getParameter("origin");
		
		File file=new File(path+"\\"+filename);
		InputStream in=null;
		OutputStream os=null;
		resp.setHeader("Content-Disposition", "attachment; filename="+origin); //다운받을때 파일이름설정
		
		// 파일다운은 브라우저에서 자동으로 잡아주기떄문에 알지못하는 엔코딩타입으로 설정
		resp.setContentType("application/octet-stream");
		
		try{
			in=new FileInputStream(file);
			os=resp.getOutputStream();
			int su=-1;
			while((su=in.read())!=-1){
				os.write(su);
			}
			os.flush();
		}finally{
			if(in!=null)in.close();
			if(os!=null)os.close();
		}
	}
}
