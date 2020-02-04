package Project_LMS_Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_Home_Model.Home_Student_Dto;
import Project_Utils.MyOracle;

public class LMS_EmployTeam_Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LMS_EmployTeam_Dao() {
	}
	
	
	
	//채용정보 리스트출력 처리부분		처리완
	public ArrayList<LMS_HireInfo_Dto> employSelectAll(int page) throws SQLException{
		String sql="select * from (select rownum as rn2, rn, infonum, infotitle, cmpexp, infocnt from (select rownum as rn, infonum, infotitle, cmpexp, infocnt from (select infonum, infotitle, cmpexp, infocnt from hireinfo order by infonum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";	
		ArrayList<LMS_HireInfo_Dto> list=new ArrayList<LMS_HireInfo_Dto>();
		int startNum=(page-1)*5+1;
		int endNum=page*5;

		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				LMS_HireInfo_Dto bean=new LMS_HireInfo_Dto();
				bean.setInfonum(rs.getInt("infonum"));
				bean.setInfotitle(rs.getString("infotitle"));
				bean.setCmpexp(rs.getString("cmpexp"));
				bean.setInfocnt(rs.getInt("infocnt"));
				
				list.add(bean);
			}
			
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}
	
	
	
	//채용정보 상세페이지 처리부분		처리완
	public LMS_HireInfo_Dto employSelectOne(int infonum, int infocnt) throws SQLException{
		String sql="select infonum, infotitle,infoauthor,infodate,infocnt,cmpname,cmpexp,cmplink from HireInfo where infonum=?";
		String sql1="update hireinfo set infocnt=? where infonum=?";
		LMS_HireInfo_Dto bean=new LMS_HireInfo_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, infocnt);
			pstmt.setInt(2, infonum);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, infonum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setInfonum(rs.getInt("infonum"));
				bean.setInfotitle(rs.getString("infotitle"));
				bean.setInfoauthor(rs.getString("infoauthor"));
				bean.setInfodate(rs.getDate("infodate"));
				bean.setInfocnt(rs.getInt("infocnt"));
				bean.setCmpname(rs.getString("cmpname"));
				bean.setCmpexp(rs.getString("cmpexp"));
				bean.setCmplink(rs.getString("cmplink"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	
	
	//채용정보 등록 처리부분		처리완
	public void employInsert(String infotitle, String infoauthor, String cmpname, String cmpexp, String cmplink) throws SQLException{
		String sql="insert into hireinfo values (hireinfo_seq.nextval,?,?,sysdate,0,?,?,?)";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, infotitle);
			pstmt.setString(2, infoauthor);
			pstmt.setString(3, cmpname);
			pstmt.setString(4, cmpexp);
			pstmt.setString(5, cmplink);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	
	
	//채용정보 삭제 처리부분	처리완
	public int employDelete(int infonum) throws SQLException{
		String sql="delete from HireInfo where infonum=?";
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, infonum);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return infonum;
	}
	
	
	
	//학생성적조회 리스트출력 처리부분		처리완
	public ArrayList<Object[]> gradeOpenSelectAll(String search, String keyword, int page) throws SQLException{
			ArrayList<Object[]> list=null;
			conn=MyOracle.getConnection();
			int startNum = (page-1)*5+1;
			int endNum = page*5;
			if(keyword==""){
				try{
					list = new ArrayList<Object[]>();
					Object[] obj = null;
					//페이지 조합
					String sql = "select * from (select rownum as rn2,rn,stunum,stuname,classname,checkpct from (select rownum as rn,stunum,stuname,classname,checkpct from (select student.stunum,stuname,classname,checkpct from student inner join attendinfo on student.stunum=attendinfo.stunum order by stunum desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
					
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, startNum);
					pstmt.setInt(2, endNum);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						Home_Student_Dto bean1=new Home_Student_Dto();
						LMS_AttendInfo_Dto bean2=new LMS_AttendInfo_Dto();
						bean1.setStunum(rs.getInt("stunum"));
						bean1.setStuname(rs.getString("stuname"));
						bean1.setClassname(rs.getString("classname"));
						bean2.setAttendpct(rs.getInt("checkpct"));
						
						obj=new Object[]{bean1,bean2};
						list.add(obj);
					}
				}finally{
					if(rs!=null)rs.close();			
					if(pstmt!=null)pstmt.close();			
					if(conn!=null)conn.close();			
				}
			}else if(keyword!=""){
				list = new ArrayList<Object[]>();
				Object[] obj = null;
				System.out.println("dao의 search,keyword : "+search+","+keyword);
				try {
					String sql = "select * from (select rownum as rn2,rn,stunum,stuname,classname,checkpct from (select rownum as rn,stunum,stuname,classname,checkpct from (select student.stunum,stuname,classname,checkpct from student inner join attendinfo on student.stunum=attendinfo.stunum where "+search+" like ? order by stunum desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
					String keyword1 = "%"+keyword+"%";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyword1);
					pstmt.setInt(2, startNum);
					pstmt.setInt(3, endNum);
					rs=pstmt.executeQuery();
					while(rs.next()){
						Home_Student_Dto bean1=new Home_Student_Dto();
						LMS_AttendInfo_Dto bean2=new LMS_AttendInfo_Dto();
						bean1.setStunum(rs.getInt("stunum"));
						bean1.setStuname(rs.getString("stuname"));
						bean1.setClassname(rs.getString("classname"));
						bean2.setAttendpct(rs.getInt("checkpct"));
						obj=new Object[]{bean1,bean2};
						list.add(obj);
					}
				}finally{
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}
			}
			return list;
			}
	
	
	
	
	//학생성적조회 상세페이지 처리부분		처리완
	public Object[] gradeOpenSelectOne(int stunum) throws SQLException{
		String sql="select stuname,classname,first,second,third from Student inner join Score on Student.stunum=Score.stunum where Student.stunum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				Home_Student_Dto bean1=new Home_Student_Dto();
				LMS_Score_Dto bean2=new LMS_Score_Dto();
				bean1.setStuname(rs.getString("stuname"));
				bean1.setClassname(rs.getString("classname"));
				bean2.setFirst(rs.getInt("first"));
				bean2.setSecond(rs.getInt("second"));
				bean2.setThird(rs.getInt("third"));
				
				obj=new Object[]{bean1,bean2};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return obj;
	}
	
	
	
	
}
