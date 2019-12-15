package service;

import java.util.List;


import model.CategoryModel;


public interface ICategoryService {
	List<CategoryModel> findAll();
	CategoryModel save(CategoryModel categoryModel);
	CategoryModel findOne(Long id);
	CategoryModel update(CategoryModel categoryModel);
}
