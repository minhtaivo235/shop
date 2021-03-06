package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;


import dao.ICategoryDAO;
import model.CategoryModel;
import paging.IPageble;
import service.ICategoryService;

public class CategoryService implements ICategoryService {
	@Inject
	private ICategoryDAO categoryDao;

	public List<CategoryModel> findAll(IPageble pageable) {
		
		return categoryDao.findAll(pageable);
	}

	public CategoryModel save(CategoryModel categoryModel) {
		categoryModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long categoryId = categoryDao.save(categoryModel);
		return categoryDao.findOne(categoryId);
	}

	public CategoryModel findOne(Long id) {
		// TODO Auto-generated method stub
		return categoryDao.findOne(id);
	}

	public CategoryModel update(CategoryModel categoryModel) {
		CategoryModel oldCate = categoryDao.findOne(categoryModel.getId());
		categoryModel.setCreatedDate(oldCate.getCreatedDate());
		categoryModel.setCreatedBy(oldCate.getCreatedBy());
		categoryModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		categoryDao.update(categoryModel);
		return categoryDao.findOne(categoryModel.getId());
	}

	public void delete(long[] ids) {
		for (long id: ids) {
			categoryDao.delete(id);
		}
		
	}

	@Override
	public int getTotalItem() {
		return categoryDao.getTotalItem();
	}

	@Override
	public List<CategoryModel> findAll() {
		return categoryDao.findAll();
	}
}
