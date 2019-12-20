package service;

import java.util.List;

import model.ProductModel;
import paging.IPageble;

public interface IProductService {
	List<ProductModel> findAll(IPageble pageable);
	List<ProductModel> findAll();
	int getTotalItem();
	ProductModel findOne(Long id);
	ProductModel save(ProductModel productModel);
	ProductModel update(ProductModel productModel);
	void delete(long[] id);
}
