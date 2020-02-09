package Project_Home_Model;

public class Home_Student_Dto {

	//rownum
	private int sturn;
	//학번
	private int stunum;			
	//학생아이디
	private String stuid;
	//학생이름
	private String stuname;
	//학생비밀번호
	private String stupw;
	//학생전화번호
	private String stuphone;
	//학생주소
	private String stuaddr;
	//학생 강좌명
	private String classname;
	//로그인상태 1=true 2=false
	private int login;
	//강사명
	private String teachername;
	//강좌번호
	private int classnum;
	//시험번호
	private int examnum;
	
	public Home_Student_Dto() {
	}
	
	public int getStunum() {
		return stunum;
	}
	public void setStunum(int stunum) {
		this.stunum = stunum;
	}
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getStupw() {
		return stupw;
	}
	public void setStupw(String stupw) {
		this.stupw = stupw;
	}
	public String getStuphone() {
		return stuphone;
	}
	public void setStuphone(String stuphone) {
		this.stuphone = stuphone;
	}
	public String getStuaddr() {
		return stuaddr;
	}
	public void setStuaddr(String stuaddr) {
		this.stuaddr = stuaddr;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public int getLogin() {
		return login;
	}
	public void setLogin(int login) {
		this.login = login;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}

	public int getClassnum() {
		return classnum;
	}

	public void setClassnum(int classnum) {
		this.classnum = classnum;
	}

	public int getSturn() {
		return sturn;
	}

	public void setSturn(int sturn) {
		this.sturn = sturn;
	}

	public int getExamnum() {
		return examnum;
	}

	public void setExamnum(int examnum) {
		this.examnum = examnum;
	}
	
	
}
