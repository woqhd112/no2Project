package Project_LMS_Model;

public class LMS_AttendInfo_Dto {

	//학번
	private int stunum;
	//전체출석퍼센트
	private int attendpct;
	//출석횟수
	private int ontime;
	//지각횟수
	private int late;
	//결석횟수
	private int absent;
	//출석률
	private int checkpct;
	
	public LMS_AttendInfo_Dto() {
	}

	public int getStunum() {
		return stunum;
	}

	public void setStunum(int stunum) {
		this.stunum = stunum;
	}

	public int getAttendpct() {
		return attendpct;
	}

	public void setAttendpct(int attendpct) {
		this.attendpct = attendpct;
	}

	public int getOntime() {
		return ontime;
	}

	public void setOntime(int ontime) {
		this.ontime = ontime;
	}

	public int getLate() {
		return late;
	}

	public void setLate(int late) {
		this.late = late;
	}

	public int getAbsent() {
		return absent;
	}

	public void setAbsent(int absent) {
		this.absent = absent;
	}

	public int getCheckpct() {
		return checkpct;
	}

	public void setCheckpct(int checkpct) {
		this.checkpct = checkpct;
	}

	
	
}
