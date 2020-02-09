package Project_LMS_Model;

import java.sql.Date;

public class LMS_FAQ_Dto {

	//FAQ번호
	private int faqnum;
	//FAQ질문
	private String faqtitle;
	//FAQ답변
	private String faqcontent;
	//게시일
	private Date faqdate;
	//작성자
	private String faqauthor;
	//학번
	private int stunum;
	
	
	public LMS_FAQ_Dto() {
	}


	public int getFaqnum() {
		return faqnum;
	}


	public void setFaqnum(int faqnum) {
		this.faqnum = faqnum;
	}


	public String getFaqtitle() {
		return faqtitle;
	}


	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}


	public String getFaqcontent() {
		return faqcontent;
	}


	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}


	public Date getFaqdate() {
		return faqdate;
	}


	public void setFaqdate(Date faqdate) {
		this.faqdate = faqdate;
	}


	public String getFaqauthor() {
		return faqauthor;
	}


	public void setFaqauthor(String faqauthor) {
		this.faqauthor = faqauthor;
	}


	public int getStunum() {
		return stunum;
	}


	public void setStunum(int stunum) {
		this.stunum = stunum;
	}


	
	
}
