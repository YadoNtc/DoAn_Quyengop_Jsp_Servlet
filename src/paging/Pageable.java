package paging;

import sorter.Sorter;

public interface Pageable {

	Integer getPage();
	Integer getLimit();
	Integer getOffset();
	Sorter getSorter();
	
}
