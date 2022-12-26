package pulu.com.common;

public class qnaPaging {
	// 검색 변수
	private int searchNum1;
	private String isSearch1;

	// 페이징 관련 변수
	private int currentPage1; // 현재페이지
	private int totalCount1; // 전체 게시물 수
	private int totalPage1; // 전체 페이지 수
	private int blockCount1; // 한 페이지의 게시물의 수
	private int blockPage1; // 한 화면에 보여줄 페이지 수
	private int startCount1; // 한 페이지에서 보여줄 게시글의 시작 번호
	private int endCount1; // 한 페이지에서 보여줄 게시글의 끝 번호
	private int startPage1; // 시작 페이지
	private int endPage1;

	private String list;
	private StringBuffer pagingHtml1;

	// 검색할 경우 댓글 페이징 생성자1
	public qnaPaging(int currentPage1, int totalCount1, int blockCount1, int blockPage1, String list, int searchNum1,
			String isSearch1) {
		this.currentPage1 = currentPage1;
		this.totalCount1 = totalCount1;
		this.blockCount1 = blockCount1;
		this.blockPage1 = blockPage1;
		this.list = list;
		this.searchNum1 = searchNum1;
		this.isSearch1 = isSearch1;

		// 전체 페이지 수
		totalPage1 = (int) Math.ceil((double) totalCount1 / blockCount1);

		if (totalPage1 == 0) {
			totalPage1 = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage1 > totalPage1) {
			currentPage1 = totalPage1;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount1 = (currentPage1 - 1) * blockCount1;
		endCount1 = startCount1 + blockCount1 - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage1 = (int) ((currentPage1 - 1) / blockPage1) * blockPage1 + 1;
		endPage1 = startPage1 + blockPage1 - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage1 > totalPage1) {
			endPage1 = totalPage1;
		}

		// 이전 block 페이지
		pagingHtml1 = new StringBuffer();

		if (currentPage1 > blockPage1) {
			if (isSearch1 == null) {
				pagingHtml1
						.append("<a class='page prv' href=" + list + "&currentPage1=" + (startPage1 - 1) + "#here3>");
			} else {
				pagingHtml1.append("<a class='page prv' href=" + list + "&searchNum1=" + searchNum1 + "&isSearch1="
						+ isSearch1 + "&currentPage=" + (startPage1 - 1) + "#here3>");
			}
			pagingHtml1.append("&lt;");
			pagingHtml1.append("</a>");
		}

		// 페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage1; i <= endPage1; i++) {
			if (i > totalPage1) {
				break;
			}
			if (i == currentPage1) {
				pagingHtml1.append("<strong>");
				pagingHtml1.append(i);
				pagingHtml1.append("</strong>");
			} else {
				if (isSearch1 == null) {
					pagingHtml1.append("<a class='page' href=" + list + "&currentPage1=");
				} else {
					pagingHtml1.append("<a class='page' href=" + list + "&searchNum1=" + searchNum1 + "&isSearch1="
							+ isSearch1 + "&currentPage=");
				}
				pagingHtml1.append(i);
				pagingHtml1.append("#here3>");
				pagingHtml1.append(i);
				pagingHtml1.append("</a>");
			}
		}

		// 다음 block 페이지
		if (totalPage1 - startPage1 >= blockPage1) {
			if (isSearch1 == null) {
				pagingHtml1.append("<a class='page next' href=" + list + "&currentPage1=" + (endPage1 + 1) + "#here3>");
			} else {
				pagingHtml1.append("<a class='page next' href=" + list + "&searchNum1=" + searchNum1 + "&isSearch1="
						+ isSearch1 + "&currentPage=" + (endPage1 + 1) + "#here3>");
			}
			pagingHtml1.append("&gt;");
			pagingHtml1.append("</a>");
		}

	}

	// 댓글 페이징 처리 생성자1
	public qnaPaging(int currentPage1, int totalCount1, int blockCount1, int blockPage1, String list) {

		this.currentPage1 = currentPage1;
		this.totalCount1 = totalCount1;
		this.blockCount1 = blockCount1;
		this.blockPage1 = blockPage1;
		this.list = list;

		// 전체 페이지 수
		totalPage1 = (int) Math.ceil((double) totalCount1 / blockCount1);
		if (totalPage1 == 0) {
			totalPage1 = 1;
		}

		// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (currentPage1 > totalPage1) {
			currentPage1 = totalPage1;
		}

		// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
		startCount1 = (currentPage1 - 1) * blockCount1;
		endCount1 = startCount1 + blockCount1 - 1;

		// 시작 페이지와 마지막 페이지 값 구하기.
		startPage1 = (int) ((currentPage1 - 1) / blockPage1) * blockPage1 + 1;
		endPage1 = startPage1 + blockPage1 - 1;

		// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if (endPage1 > totalPage1) {
			endPage1 = totalPage1;
		}

		// 이전 block 페이지
		pagingHtml1 = new StringBuffer();

		if (currentPage1 > blockPage1) {
			pagingHtml1.append("<a class='page prv' href=" + list + "&currentPage1=" + (startPage1 - 1) + "#here3>");
			pagingHtml1.append("&lt;");
			pagingHtml1.append("</a>");
		}

		// 페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
		for (int i = startPage1; i <= endPage1; i++) {
			if (i > totalPage1) {
				break;
			}
			if (i == currentPage1) {
				pagingHtml1.append("<strong>");
				pagingHtml1.append(i);
				pagingHtml1.append("</strong>");
			} else {
				pagingHtml1.append("<a class='page' href=" + list + "&currentPage1=");
				pagingHtml1.append(i);
				pagingHtml1.append("#here3>");
				pagingHtml1.append(i);
				pagingHtml1.append("</a>");
			}
		}

		// 다음 block 페이지
		if (totalPage1 - startPage1 >= blockPage1) {
			pagingHtml1.append("<a class='page next' href=" + list + "&currentPage1=" + (endPage1 + 1) + "#here3>");
			pagingHtml1.append("&gt;");
			pagingHtml1.append("</a>");
		}
	}

	public int getSearchNum1() {
		return searchNum1;
	}

	public void setSearchNum1(int searchNum1) {
		this.searchNum1 = searchNum1;
	}

	public String getIsSearch1() {
		return isSearch1;
	}

	public void setIsSearch1(String isSearch1) {
		this.isSearch1 = isSearch1;
	}

	public int getCurrentPage1() {
		return currentPage1;
	}

	public void setCurrentPage1(int currentPage1) {
		this.currentPage1 = currentPage1;
	}

	public int getTotalCount1() {
		return totalCount1;
	}

	public void setTotalCount1(int totalCount1) {
		this.totalCount1 = totalCount1;
	}

	public int getTotalPage1() {
		return totalPage1;
	}

	public void setTotalPage1(int totalPage1) {
		this.totalPage1 = totalPage1;
	}

	public int getBlockCount1() {
		return blockCount1;
	}

	public void setBlockCount1(int blockCount1) {
		this.blockCount1 = blockCount1;
	}

	public int getBlockPage1() {
		return blockPage1;
	}

	public void setBlockPage1(int blockPage1) {
		this.blockPage1 = blockPage1;
	}

	public int getStartCount1() {
		return startCount1;
	}

	public void setStartCount1(int startCount1) {
		this.startCount1 = startCount1;
	}

	public int getEndCount1() {
		return endCount1;
	}

	public void setEndCount1(int endCount1) {
		this.endCount1 = endCount1;
	}

	public int getStartPage1() {
		return startPage1;
	}

	public void setStartPage1(int startPage1) {
		this.startPage1 = startPage1;
	}

	public int getEndPage1() {
		return endPage1;
	}

	public void setEndPage1(int endPage1) {
		this.endPage1 = endPage1;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	public StringBuffer getPagingHtml1() {
		return pagingHtml1;
	}

	public void setPagingHtml1(StringBuffer pagingHtml1) {
		this.pagingHtml1 = pagingHtml1;
	}

}
