package service;

import java.util.List;


import model.CategoryModel;
import paging.IPageble;


public interface ICategoryService {
	List<CategoryModel> findAll(IPageble pageable);
	CategoryModel save(CategoryModel categoryModel);
	CategoryModel findOne(Long id);
	CategoryModel update(CategoryModel categoryModel);
	void delete(long[] id);
	int getTotalItem();
}
