package paging;

import sort.Sorter;

public interface IPageble {
	Integer getPage();
	Integer getOffset();
	Integer getLimit();
	Sorter getSorter();
}
