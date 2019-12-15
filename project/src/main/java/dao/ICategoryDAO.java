package dao;

import java.util.List;

import model.CategoryModel;


public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	List<CategoryModel> findAll();
	CategoryModel findOne(Long id);
	CategoryModel findOneByCode(String code);
	Long save(CategoryModel categoryModel);
	void update(CategoryModel categoryModel);
}
