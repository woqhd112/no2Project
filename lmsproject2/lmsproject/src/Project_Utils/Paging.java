package Project_Utils;

//페이지관리
public class Paging {

	//현재 페이지
	private int page=1;	
	//전체 게시글수
	private int totalCount;
	//출력 시작
	private int beginPage;
	//출력 끝
	private int endPage;
	//한 페이지에 row갯수
	private int displayRow=10;
	//한페이지에 보이는 맥스 페이지갯수
	private int displayPage=10;
	//prev 버튼 활성화
	boolean prev;
	//next 버튼 활성화
	boolean next;
	
	private int displayRow2=5;
	
	public Paging() {
	}
	
	public void setTotalCount(int totalCount){
		
		this.totalCount=totalCount;
		paging();
	}
	
	public void setTotalCount2(int totalCount){
		
		this.totalCount=totalCount;
		paging2();
	}

	private void paging(){
		int totalPage=totalCount/displayRow;
		
		//맥스페이지 갯수 조건
		System.out.println("다음페이지 유뮤 : "+(totalCount%displayRow!=0));
		if(totalCount%displayRow!=0){
			totalPage+=1;
		}
		//prev,next,beginPage,endPage를 계산
		endPage = ((page+(displayPage-1))/displayPage)*displayPage;
		beginPage = endPage - (displayPage-1);
		
		if(totalPage<endPage){
			endPage=totalPage;
			next=false;
		}else{
			next=true;
		}
		if(beginPage==1){
			prev=false;
		}else{
			prev=true;
		}
		//prev=(beginPage==1)?false:true;
	}
	
	private void paging2(){
		int totalPage=totalCount/displayRow2;
		
		//맥스페이지 갯수 조건
		System.out.println("다음페이지 유뮤 : "+(totalCount%displayRow2!=0));
		if(totalCount%displayRow2!=0){
			totalPage+=1;
		}
		//prev,next,beginPage,endPage를 계산
		endPage = ((page+(displayPage-1))/displayPage)*displayPage;
		beginPage = endPage - (displayPage-1);
		
		if(totalPage<endPage){
			endPage=totalPage;
			next=false;
		}else{
			next=true;
		}
		if(beginPage==1){
			prev=false;
		}else{
			prev=true;
		}
		//prev=(beginPage==1)?false:true;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getDisplayRow() {
		return displayRow;
	}

	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public int getDisplayPage() {
		return displayPage;
	}

	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	
}
