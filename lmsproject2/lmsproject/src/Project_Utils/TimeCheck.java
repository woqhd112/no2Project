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
	
	//������ ����
	public int attendTimeReturn(){
		date1=new SimpleDateFormat("HHmmss");
		time1=Integer.parseInt(date1.format(today));
		
		if(time1>93000&&time1<140000){
			attendstat=2;
			System.out.println("����");
		}else if(time1<=93000&&time1>=0){
			attendstat=1;
			System.out.println("�����⼮");
		}else if(time1>=140000){
			attendstat=3;
			System.out.println("�Ἦ");
		}
		
		return attendstat;
	}
	
	//���� �������� ���� ����,������¥ ������ �� �ϼ� ���ϴ°�
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
	
	
	//����ð� ����
	public String getTime(){
		date2=new SimpleDateFormat("a hh�� mm��");
		time2=date2.format(today);
		return time2;
	}
	
	//������ �����ϴ°�(�����⼮,����,�Ἦ)
	public int[] attendInfoReturn(Object[] obj1,int diffDays){
		this.diffDays=diffDays;
		Object[] obj=obj1;
		LMS_AttendInfo_Dto check1=(LMS_AttendInfo_Dto)obj[0];
		Home_AttendTime_Dto check2=(Home_AttendTime_Dto)obj[1];
		int stunum=check2.getStunum();
		int ontime=check1.getOntime();
		int late=check1.getLate();
		int absent=check1.getAbsent();
		int attendstat=check2.getAttendstat();
		String leavetime=check2.getLeavetime();
		int attendpct=0;
		int checkpct=0;
		
		int[] checking=null;
		
		//�Խǹ�ư�� �����⼮�̰� ��ǹ�ư ��������		-ó�� �����⼮+1
		if(attendstat==1&&!leavetime.equals("")){
			System.out.println("�����⼮ ����");
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
			
		//�Խǹ�ư�� �����̰� ��ǹ�ư ��������		-ó�� ����+1
		}else if(attendstat==2&&!leavetime.equals("")){
			System.out.println("���� ����");
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
			
		//�Խǹ�ư�� �����⼮�̰� ��ǹ�ư �ȴ�������		-ó�� �Ἦ+1
		}else if(attendstat==1&&leavetime.equals("")){
			System.out.println("��ǹ�ư �ȴ��� �����⼮ ����");
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
			
		//�Խǹ�ư�� �����̰� ��ǹ�ư �ȴ�������		-ó�� �Ἦ+1
		}else if(attendstat==2&&leavetime.equals("")){
			System.out.println("��ǹ�ư �ȴ��� ���� ����");
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
			
		//�Խǹ�ư ����������		-ó�� �Ἦ+1
		}else if(attendstat==3){
			System.out.println("�Խǹ�ư �ȴ��� ����,�Ἦ ����");
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
			
		//�׹ۿ� ���������� ������η� �շ�����		-ó�� �Ἦ+1
		}else{
			System.out.println("�Ἦ ����");
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
