package Project_LMS_Model;

import java.sql.Date;

public class LMS_HireInfo_Dto {

	//rownum
	private int inforn;
	//채용정보 번호
	private int infonum;
	//채용정보 제목
	private String infotitle;
	//게시일
	private Date infodate;
	//작성자
	private String infoauthor;
	//조회수
	private int infocnt;
	//회사명
	private String cmpname;
	//마감일
	private String cmpexp;
	//회사링크
	private String cmplink;
	
	public LMS_HireInfo_Dto() {
	}

	public int getInfonum() {
		return infonum;
	}

	public void setInfonum(int infonum) {
		this.infonum = infonum;
	}

	public String getInfotitle() {
		return infotitle;
	}

	public void setInfotitle(String infotitle) {
		this.infotitle = infotitle;
	}

	public Date getInfodate() {
		return infodate;
	}

	public void setInfodate(Date infodate) {
		this.infodate = infodate;
	}

	public String getInfoauthor() {
		return infoauthor;
	}

	public void setInfoauthor(String infoauthor) {
		this.infoauthor = infoauthor;
	}

	public int getInfocnt() {
		return infocnt;
	}

	public void setInfocnt(int infocnt) {
		this.infocnt = infocnt;
	}

	public String getCmpname() {
		return cmpname;
	}

	public void setCmpname(String cmpname) {
		this.cmpname = cmpname;
	}

	public String getCmpexp() {
		return cmpexp;
	}

	public void setCmpexp(String cmpexp) {
		this.cmpexp = cmpexp;
	}

	public String getCmplink() {
		return cmplink;
	}

	public void setCmplink(String cmplink) {
		this.cmplink = cmplink;
	}

	public int getInforn() {
		return inforn;
	}

	public void setInforn(int inforn) {
		this.inforn = inforn;
	}
	
	
	
}
