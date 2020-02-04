package Project_Utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Project_Home_Model.Home_AttendTime_Dto;
import Project_LMS_Model.LMS_AttendInfo_Dto;

public class TimeCheck {

	private Date today;
	private SimpleDateFormat date1,date2;
	private int attendstat;
	private int time1;
	private String time2;
	private int attendpct;
	private int checkpct;
	private String startdate;
	private String enddate;
	int diffDays;
	
	public TimeCheck() {
		today=new Date();
	}
	
	//출결상태 리턴
	public int attendTimeReturn(){
		date1=new SimpleDateFormat("HHmmss");
		time1=Integer.parseInt(date1.format(today));
		
		if(time1>93000&&time1<140000){
			attendstat=2;
			System.out.println("지각");
		}else if(time1<=93000&&time1>=0){
			attendstat=1;
			System.out.println("정상출석");
		}else if(time1>=140000){
			attendstat=3;
			System.out.println("결석");
		}
		
		return attendstat;
	}
	
	public int subAttendTime(String startdate,String enddate){
		this.startdate=startdate;
		this.enddate=enddate;
		int diffDays=0;
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd"); 
		try {
			Date beginDate = formatter.parse(startdate);
			Date endDate = formatter.parse(enddate);
			
			long diff = endDate.getTime() - beginDate.getTime();
			diffDays = (int) (diff / (24 * 60 * 60 * 1000));
			System.out.println(diffDays);
			
		} catch (ParseException e) {
			e.printStackTrace();
		} 

		return diffDays;
	}
	
	
	//현재시각 리턴
	public String getTime(){
		date2=new SimpleDateFormat("yyyy년MM월dd일ahh시mm분ss초");
		time2=date2.format(today);
		return time2;
	}
	
	//출결상태 리턴하는곳(정상출석,지각,결석)
	public int[] attendInfoReturn(Object[] obj1,int diffDays){
		this.diffDays=diffDays;
		Object[] obj=obj1;
		LMS_AttendInfo_Dto check1=(LMS_AttendInfo_Dto)obj[0];
		Home_AttendTime_Dto check2=(Home_AttendTime_Dto)obj[1];
		int stunum=check2.getStunum();
		int ontime=check1.getOntime();
		int late=check1.getLate();
		int absent=check1.getAbsent();
		String leavetime=check2.getLeavetime();
		int attendpct=0;
		int checkpct=0;
		
		int[] checking=null;
		
		//입실버튼시 정상출석이고 퇴실버튼 눌렀을때		-처리 정상출석+1
		if(attendstat==1&&leavetime!=""){
			System.out.println("정상출석 접근");
			ontime+=1;
			try{
				attendpct=(int) Math.round((((double)(ontime+late+absent)/this.diffDays)*100));
				checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
			}catch(java.lang.ArithmeticException e){
				attendpct=0;
				checkpct=0;
			}
			checking=new int[]{stunum,ontime,late,absent,attendpct,checkpct};
			
			return checking;
			
		//입실버튼시 지각이고 퇴실버튼 눌렀을때		-처리 지각+1
		}else if(attendstat==2&&leavetime!=""){
			System.out.println("지각 접근");
			late+=1;
			try{
				attendpct=(int) Math.round((((double)(ontime+late+absent)/this.diffDays)*100));
				checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
			}catch(java.lang.ArithmeticException e){
				attendpct=0;
				checkpct=0;
			}
			checking=new int[]{stunum,ontime,late,absent,attendpct,checkpct};
			
			return checking;
			
		//입실버튼시 정상출석이고 퇴실버튼 안눌렀을때		-처리 결석+1
		}else if(attendstat==1&&leavetime==""){
			System.out.println("퇴실버튼 안누른 정상출석 접근");
			absent+=1;
			try{
				attendpct=(int) Math.round((((double)(ontime+late+absent)/this.diffDays)*100));
				checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
			}catch(java.lang.ArithmeticException e){
				attendpct=0;
				checkpct=0;
			}
			checking=new int[]{stunum,ontime,late,absent,attendpct,checkpct};
			
			return checking;
			
		//입실버튼시 지각이고 퇴실버튼 안눌렀을때		-처리 결석+1
		}else if(attendstat==2&&leavetime==""){
			System.out.println("퇴실버튼 안누른 지각 접근");
			absent+=1;
			try{
				attendpct=(int) Math.round((((double)(ontime+late+absent)/this.diffDays)*100));
				checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
			}catch(java.lang.ArithmeticException e){
				attendpct=0;
				checkpct=0;
			}
			checking=new int[]{stunum,ontime,late,absent,attendpct,checkpct};
			
			return checking;
			
		//입실버튼 못눌렀을때		-처리 결석+1
		}else if(attendstat==3){
			System.out.println("입실버튼 안누른 상태 접근");
			absent+=1;
			try{
				attendpct=(int) Math.round((((double)(ontime+late+absent)/this.diffDays)*100));
				checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
			}catch(java.lang.ArithmeticException e){
				attendpct=0;
				checkpct=0;
			}
			checking=new int[]{stunum,ontime,late,absent,attendpct,checkpct};
			
			return checking;
			
		//그밖에 정상적이지 않은경로로 뚫렸을때		-처리 결석+1
		}else{
			System.out.println("결석 접근");
			absent+=1;
			try{
				attendpct=(int) Math.round((((double)(ontime+late+absent)/this.diffDays)*100));
				checkpct=(int) Math.round((((double)(ontime+late)/(ontime+late+absent))*100));
			}catch(java.lang.ArithmeticException e){
				attendpct=0;
				checkpct=0;
			}
			checking=new int[]{stunum,ontime,late,absent,attendpct,checkpct};
			
			return checking;
		}
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
