package Project_Home_Model;

public class Home_Student_Dto {

	//rownum
	private int sturn;
	//�й�
	private int stunum;			
	//�л����̵�
	private String stuid;
	//�л��̸�
	private String stuname;
	//�л���й�ȣ
	private String stupw;
	//�л���ȭ��ȣ
	private String stuphone;
	//�л��ּ�
	private String stuaddr;
	//�л� ���¸�
	private String classname;
	//�α��λ��� 1=true 2=false
	private int login;
	//�����
	private String teachername;
	//���¹�ȣ
	private int classnum;
	//�����ȣ
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
