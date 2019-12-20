package dao;

import java.util.List;

import model.ProductModel;
import paging.IPageble;

public interface IProductDAO extends GenericDAO<ProductModel> {
	List<ProductModel> findAll(IPageble pageable);
	List<ProductModel> findAll();
	int getTotalItem();
	ProductModel findOne(Long id);
	Long save(ProductModel model);
	void update(ProductModel model);
	void delete(long id);
}
