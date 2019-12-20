package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.IProductDAO;
import model.ProductModel;
import paging.IPageble;
import service.IProductService;

public class ProductService implements IProductService {
	@Inject
	private IProductDAO productDao;

	@Override
	public List<ProductModel> findAll(IPageble pageable) {
		// TODO Auto-generated method stub
		return productDao.findAll(pageable);
	}

	@Override
	public int getTotalItem() {
		// TODO Auto-generated method stub
		return productDao.getTotalItem();
	}

	@Override
	public ProductModel findOne(Long id) {
		// TODO Auto-generated method stub
		return productDao.findOne(id);
	}

	@Override
	public List<ProductModel> findAll() {
		// TODO Auto-generated method stub
		return productDao.findAll();
	}

	@Override
	public ProductModel save(ProductModel productModel) {
		productModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		productModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		productModel.setModifiedBy("");
		Long categoryId = productDao.save(productModel);
		return productDao.findOne(categoryId);
	}

	@Override
	public ProductModel update(ProductModel productModel) {
		ProductModel oldProduct = productDao.findOne(productModel.getId());
		productModel.setCreatedDate(oldProduct.getCreatedDate());
		productModel.setCreatedBy(oldProduct.getCreatedBy());
		productModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		productDao.update(productModel);
		return productDao.findOne(productModel.getId());
	}

	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			productDao.delete(id);
		}
	}

}
