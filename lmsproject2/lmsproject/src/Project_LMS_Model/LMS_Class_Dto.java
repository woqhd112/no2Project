package Project_LMS_Model;

public class LMS_Class_Dto {

	//강좌번호
	private int classnum;
	//강좌명
	private String classname;
	//시작일
	private String startdate;
	//마감일
	private String enddate;
	//강사이름
	private String teachername;
	//수업진행률
	private int total;
	
	public LMS_Class_Dto() {
	}

	public int getClassnum() {
		return classnum;
	}

	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	
	
}
