package com.trent.dbUtil.ibatis;
import java.io.Serializable;
import java.util.List;
/**
 * 分页工具类，包括总条数、当前页、每页显示条数等数据
 * @author howard
 *
 */
public class Page implements Serializable {
	
	private int pageSize;//每页显示条数
	private int pageNo=1;//当前页数，默认为1
	private List data;//查询数据，存储当页要展示的数据
	private int totalRows;//总条数
	
	private static final long serialVersionUID = 5247894882002876129L;
	public Page(int pageNo) {
		this.pageNo = pageNo;
		this.pageSize = 10;
	}

	public Page(int pageNo, int pageSize) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		if (totalRows % pageSize == 0)
			return totalRows/pageSize;
		else
			return totalRows/pageSize + 1;
	}

	public int getPageSize() {
		return pageSize;
	}

	public boolean hasNextPage() {
		return getPageNo() < getTotalPages() - 1;
	}

	public boolean hasPreviousPage() {
		return getPageNo() > 1;
	}

	public int getStartRow() {
		return (pageNo - 1) * pageSize;
	}

	public int getEndRow() {
		return pageNo * pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

}