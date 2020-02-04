package Project_LMS_Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_Home_Model.Home_Student_Dto;
import Project_Utils.MyOracle;

public class LMS_SalesTeam_Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LMS_SalesTeam_Dao() {
	}
	
	
	//모집공고 리스트출력 처리부분		처리완
	public ArrayList<Object[]> regnotSelectAll(int page) throws SQLException{
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		
		String sql="select * from (select rownum as rn2,rn,regnum,classname,regcnt from (select rownum as rn,regnum,classname,regcnt from (select regnum,classname,regcnt from regnot inner join class on regnot.classnum=class.classnum order by regnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
		
		ArrayList<Object[]> list=new ArrayList<Object[]>();
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				if(!rs.getString("classname").equals("미배정")){
					LMS_Class_Dto bean1=new LMS_Class_Dto();
					LMS_Regnot_Dto bean2=new LMS_Regnot_Dto();
					bean2.setRegnum(rs.getInt("regnum"));
					bean1.setClassname(rs.getString("classname"));
					bean2.setRegcnt(rs.getInt("regcnt"));
					
					obj=new Object[]{bean1,bean2};
					list.add(obj);
				}
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	} 
	
	
	
	//모집공고 상세페이지 처리부분		처리완
	public Object[] regnotSelectOne(int regnum, int regcnt) throws SQLException{
		String sql="select regnum,classname,startdate,enddate,regauthor,regdate,regcnt,regcontent,regfile,origin from Class inner join Regnot on Class.classnum=Regnot.classnum where regnum=?";
		String sql1="update regnot set regcnt=? where regnum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, regcnt);
			pstmt.setInt(2, regnum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regnum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				LMS_Regnot_Dto bean1=new LMS_Regnot_Dto();
				LMS_Class_Dto bean2=new LMS_Class_Dto();
				bean1.setRegnum(rs.getInt("regnum"));
				bean2.setClassname(rs.getString("classname"));
				bean2.setStartdate(rs.getString("startdate"));
				bean2.setEnddate(rs.getString("enddate"));
				bean1.setRegauthor(rs.getString("regauthor"));
				bean1.setRegdate(rs.getDate("regdate"));
				bean1.setRegcnt(rs.getInt("regcnt"));
				bean1.setRegcontent(rs.getString("regcontent"));
				bean1.setRegfile(rs.getString("regfile"));
				bean1.setOrigin(rs.getString("origin"));
				
				obj=new Object[]{bean1,bean2};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return obj;
	}
	
	
	
	
	
	//모집공고 등록 처리부분		처리완
	public int regnotInsert(int classnum, String regauthor, String regcontent,String regfile,String origin) throws SQLException{
		String sql="insert into Regnot values (Regnot_seq.nextval,?,sysdate,0,?,?,?,?)";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, regauthor);
			pstmt.setString(2, regcontent);
			pstmt.setInt(3, classnum);
			pstmt.setString(4, regfile);
			pstmt.setString(5, origin);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	
	//모집공고 수정 처리부분		처리완
	public int regnotUpdate(int regnum, String regcontent, String regfile, String origin) throws SQLException{
		String sql="update Regnot set regcontent=?,regfile=?,origin=? where regnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, regcontent);
			pstmt.setString(2, regfile);
			pstmt.setString(3, origin);
			pstmt.setInt(4, regnum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	
	
	//모집공고 삭제 처리부분		처리완
	public int regnotDelete(int regnum) throws SQLException{
		String sql="delete from Regnot where regnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, regnum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
		
	}
	
	
	
	//학생수강등록 리스트출력 처리부분		처리완
	public ArrayList<Home_Student_Dto> studentSubUpSelectAll(String search,String keyword,int page) throws SQLException{
		ArrayList<Home_Student_Dto> list=null;
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		
		if(keyword==""){
			list=new ArrayList<Home_Student_Dto>();
			String sql="select * from (select rownum as rn2,rn,stunum,stuname,classname from (select rownum as rn,stunum,stuname,classname from (select stunum,stuname,classname from student order by stuname desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Home_Student_Dto bean=new Home_Student_Dto();
					bean.setStunum(rs.getInt("stunum"));
					bean.setStuname(rs.getString("stuname"));
					bean.setClassname(rs.getString("classname"));
					
					list.add(bean);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
			
		}else if(keyword!=null){
			list=new ArrayList<Home_Student_Dto>();
			System.out.println("dao의 search,keyword : "+search+","+keyword);
			String sql="select * from (select rownum as rn2,rn,stunum,stuname,classname from (select rownum as rn,stunum,stuname,classname from (select stunum,stuname,classname from student where "+search+" like ? order by stuname desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			String keyword1="%"+keyword+"%";
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, keyword1);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Home_Student_Dto bean=new Home_Student_Dto();
					bean.setStunum(rs.getInt("stunum"));
					bean.setStuname(rs.getString("stuname"));
					bean.setClassname(rs.getString("classname"));
					
					list.add(bean);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
		}
		return list;
	}
	
	
		
	//학생수강등록 상세페이지 처리부분		처리완
	public Home_Student_Dto studentSubUpSelectOne(int stunum) throws SQLException{
		String sql="select stunum,stuname,classname,examnum from Student where stunum=?";
		Home_Student_Dto bean=new Home_Student_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setStunum(rs.getInt("stunum"));
				bean.setStuname(rs.getString("stuname"));
				bean.setClassname(rs.getString("classname"));
				bean.setExamnum(rs.getInt("examnum"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	
	
	//학생수강등록 수정 처리부분		처리완
	public int studentSubUpUpdate(int stunum, String classname,int classnum,String teachername,int examnum) throws SQLException{
		String sql="update Student set classname=?,classnum=?,teachername=?,examnum=? where stunum=?";
		String sql1="update score set examnum=?,first=0,second=0,third=0 where stunum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, classname);
			pstmt.setInt(2, classnum);
			pstmt.setString(3, teachername);
			pstmt.setInt(4, examnum);
			pstmt.setInt(5, stunum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, examnum);
			pstmt.setInt(2, stunum);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			conn.rollback();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
		
	}
	
}
