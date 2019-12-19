package dao;

import java.util.List;


import model.CategoryModel;
import paging.IPageble;


public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	List<CategoryModel> findAll(IPageble pageable);
	CategoryModel findOne(Long id);
	CategoryModel findOneByCode(String code);
	Long save(CategoryModel categoryModel);
	void update(CategoryModel categoryModel);
	void delete(long id);
	int getTotalItem();
}
