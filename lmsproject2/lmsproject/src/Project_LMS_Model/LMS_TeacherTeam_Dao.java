package Project_LMS_Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Project_Home_Model.Home_Student_Dto;
import Project_Utils.MyOracle;

public class LMS_TeacherTeam_Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LMS_TeacherTeam_Dao() {
	}
	
	
	
	//矫氰免力 府胶飘免仿 贸府何盒		贸府肯
	public ArrayList<LMS_Exam_Dto> examUpSelectAll(int page) throws SQLException{
		String sql="select * from (select rownum rn2,rn,teachername,examnum,examname,examorder from (select rownum rn,teachername,examnum,examname,examorder from (select teachername,examnum,examname,examorder from Exam order by examnum asc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
		ArrayList<LMS_Exam_Dto> list=new ArrayList<LMS_Exam_Dto>();
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				if(!rs.getString("teachername").equals("固硅沥")){
					if(rs.getString("examname")!=null){
						LMS_Exam_Dto bean=new LMS_Exam_Dto();
						bean.setTeachername(rs.getString("teachername"));
						bean.setExamnum(rs.getInt("examnum"));
						bean.setExamname(rs.getString("examname"));
						bean.setExamorder(rs.getString("examorder"));
						
						list.add(bean);
					}
				}
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return list;
	}
	
	
	//矫氰免力 惑技其捞瘤 贸府何盒		贸府肯
	public LMS_Exam_Dto examUpSelectOne(int examnum) throws SQLException{
		String sql="select examnum,examname,examorder,teachername,examdate,examexp,examcontent,examfile,origin from Exam where examnum=?";
		LMS_Exam_Dto bean=new LMS_Exam_Dto();
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, examnum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setExamnum(rs.getInt("examnum"));
				bean.setExamname(rs.getString("examname"));
				bean.setExamorder(rs.getString("examorder"));
				bean.setTeachername(rs.getString("teachername"));
				bean.setExpdate(rs.getDate("examdate"));
				bean.setExamexp(rs.getString("examexp"));
				bean.setExamcontent(rs.getString("examcontent"));
				bean.setExamfile(rs.getString("examfile"));
				bean.setOrigin(rs.getString("origin"));
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return bean;
	}
	
	
	//矫氰免力 殿废 贸府何盒		贸府肯
	public int examUpInsert(String examname,String teachername, String examorder, String examexp, String examcontent,String examfile,String origin,int classnum) throws SQLException{
		String sql="update exam set examname=?,teachername=?,examorder=?,examexp=?,examcontent=?,examfile=?,origin=? where classnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, examname);
			pstmt.setString(2, teachername);
			pstmt.setString(3, examorder);
			pstmt.setString(4, examexp);
			pstmt.setString(5, examcontent);
			pstmt.setString(6, examfile);
			pstmt.setString(7, origin);
			pstmt.setInt(8, classnum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
		
	}
	
	
	//矫氰免力 荐沥 贸府何盒		贸府肯
	public int examUpUpdate(int examnum, String examname, String examcontent,String examfile,String origin) throws SQLException{
		String sql="update Exam set examname=?, examcontent=?,examfile=?,origin=? where examnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, examname);
			pstmt.setString(2, examcontent);
			pstmt.setString(3, examfile);
			pstmt.setString(4, origin);
			pstmt.setInt(5, examnum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	//矫氰免力 昏力 贸府何盒		贸府肯
	public int examUpDelete(int examnum) throws SQLException{
		String sql="update exam set examname='',teachername='固硅沥',examorder='1瞒',examexp='',examcontent='',examfile='',origin='' where examnum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, examnum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	//己利包府 府胶飘免仿 贸府何盒		贸府肯
	public ArrayList<Object[]> gradeAdminSelectAll(String empname,String search,String keyword,int page) throws SQLException{
		ArrayList<Object[]> list=null;
		Object[] obj=null;
		int startNum=(page-1)*5+1;
		int endNum=page*5;
		if(keyword!=""){
			String sql="select * from (select rownum rn2,rn,stunum,classname,teachername,stuname,checkpct,first,second,third from (select rownum rn,stunum,classname,teachername,stuname,checkpct,first,second,third from (select stunum,classname,teachername,stuname,checkpct,first,second,third from student inner join emp1 on student.teachername=emp1.empname inner join attendinfo on student.stunum=attendinfo.stunum inner join score on student.stunum=score.stunum where student.teachername=? order by stuname desc) where "+search+" like ? order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			String keyword1="%"+keyword+"%";
			list=new ArrayList<Object[]>();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, empname);
				pstmt.setString(2, keyword1);
				pstmt.setInt(3, startNum);
				pstmt.setInt(4, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Home_Student_Dto bean1=new Home_Student_Dto();
					LMS_AttendInfo_Dto bean2=new LMS_AttendInfo_Dto();
					LMS_Score_Dto bean3=new LMS_Score_Dto();
					bean1.setStunum(rs.getInt("stunum"));
					bean1.setClassname(rs.getString("classname"));
					bean1.setStuname(rs.getString("stuname"));
					bean2.setCheckpct(rs.getInt("checkpct"));
					bean3.setFirst(rs.getInt("first"));
					bean3.setSecond(rs.getInt("second"));
					bean3.setThird(rs.getInt("third"));
					
					obj=new Object[]{bean1,bean2,bean3};
					list.add(obj);
				}
			}finally{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}
		}else if(keyword==""){
			String sql="select * from (select rownum rn2,rn,stunum,classname,teachername,stuname,checkpct,first,second,third from (select rownum rn,stunum,classname,teachername,stuname,checkpct,first,second,third from (select stunum,classname,teachername,stuname,checkpct,first,second,third from student inner join emp1 on student.teachername=emp1.empname inner join attendinfo on student.stunum=attendinfo.stunum inner join score on student.stunum=score.stunum where student.teachername=? order by stuname desc) order by rn desc) order by rn2 desc) where rn2>=? and rn2<=?";
			list=new ArrayList<Object[]>();
			try{
				conn=MyOracle.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, empname);
				pstmt.setInt(2, startNum);
				pstmt.setInt(3, endNum);
				rs=pstmt.executeQuery();
				while(rs.next()){
					Home_Student_Dto bean1=new Home_Student_Dto();
					LMS_AttendInfo_Dto bean2=new LMS_AttendInfo_Dto();
					LMS_Score_Dto bean3=new LMS_Score_Dto();
					bean1.setStunum(rs.getInt("stunum"));
					bean1.setClassname(rs.getString("classname"));
					bean1.setStuname(rs.getString("stuname"));
					bean2.setCheckpct(rs.getInt("checkpct"));
					bean3.setFirst(rs.getInt("first"));
					bean3.setSecond(rs.getInt("second"));
					bean3.setThird(rs.getInt("third"));
					
					obj=new Object[]{bean1,bean2,bean3};
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
	
	
	
	//己利包府 惑技其捞瘤 免仿 贸府何盒		贸府肯
	public Object[] gradeAdminSelectOne(int stunum) throws SQLException{
		String sql="select stunum,stuname,checkpct,first,second,third from Student inner join AttendInfo on Student.stunum=AttendInfo.stunum inner join Score on Student.stunum=Score.stunum where Student.stunum=?";
		Object[] obj=null;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, stunum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				Home_Student_Dto bean1=new Home_Student_Dto();
				LMS_AttendInfo_Dto bean2=new LMS_AttendInfo_Dto();
				LMS_Score_Dto bean3=new LMS_Score_Dto();
				bean1.setStunum(rs.getInt("stunum"));
				bean1.setStuname(rs.getString("stuname"));
				bean2.setCheckpct(rs.getInt("checkpct"));
				bean3.setFirst(rs.getInt("first"));
				bean3.setSecond(rs.getInt("second"));
				bean3.setThird(rs.getInt("third"));
				
				obj=new Object[]{bean1, bean2, bean3};
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return obj;
	}
	
	
	
	//己利包府 殿废 贸府何盒		贸府肯
	public int gradeAdminInsert(int stunum, int first, int second, int third ) throws SQLException{
		String sql="update score set first=?,second=?,third=? where stunum=?";
		int result=0;
		try{
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, first);
			pstmt.setInt(2, second);
			pstmt.setInt(3, third);
			pstmt.setInt(4, stunum);
			result=pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		return result;
	}
	
	
	
	
	
}
