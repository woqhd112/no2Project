package Project_LMS_Model;

import java.sql.Date;

public class LMS_Notice_Dto {

	//rownum
	private int notrn;
	//공지사항 번호
	private int notnum;
	//공지사항 제목
	private String nottitle;
	//공지 사항 내용
	private String notcontent;
	//작성자
	private String notauthor;
	//게시일
	private Date notdate;
	//조회수
	private int cnt;
	
	public LMS_Notice_Dto() {
	}

	public int getNotnum() {
		return notnum;
	}

	public void setNotnum(int notnum) {
		this.notnum = notnum;
	}

	public String getNottitle() {
		return nottitle;
	}

	public void setNottitle(String nottitle) {
		this.nottitle = nottitle;
	}

	public String getNotcontent() {
		return notcontent;
	}

	public void setNotcontent(String notcontent) {
		this.notcontent = notcontent;
	}

	public String getNotauthor() {
		return notauthor;
	}

	public void setNotauthor(String notauthor) {
		this.notauthor = notauthor;
	}

	public Date getNotdate() {
		return notdate;
	}

	public void setNotdate(Date notdate) {
		this.notdate = notdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getNotrn() {
		return notrn;
	}

	public void setNotrn(int notrn) {
		this.notrn = notrn;
	}
	
	
}
