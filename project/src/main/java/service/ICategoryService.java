package service;

import java.util.List;


import model.CategoryModel;
import paging.IPageble;


public interface ICategoryService {
	List<CategoryModel> findAll(IPageble pageable);
	List<CategoryModel> findAll();
	int getTotalItem();
	CategoryModel save(CategoryModel categoryModel);
	CategoryModel findOne(Long id);
	CategoryModel update(CategoryModel categoryModel);
	void delete(long[] id);
}
