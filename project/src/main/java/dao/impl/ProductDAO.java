package dao.impl;

import java.util.List;

import dao.IProductDAO;

import mapper.ProductMapper;

import model.ProductModel;
import paging.IPageble;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {

	@Override
	public List<ProductModel> findAll(IPageble pageable) {
		StringBuilder sql = new StringBuilder("select * from product");
		if(pageable.getSorter() != null) {
			sql.append(" order by "+ pageable.getSorter().getSortName() +" "+ pageable.getSorter().getSortBy() +" ");
		}
		if (pageable.getOffset() != null && pageable.getLimit() != null) {
			sql.append("limit "+pageable.getOffset()+","+pageable.getLimit()+"");					
		}
		return query(sql.toString(), new ProductMapper());
	}

	@Override
	public int getTotalItem() {
		String sql = "select count(*) from product";
		return count(sql);
	}

	@Override
	public ProductModel findOne(Long id) {
		String sql = "select * from product where id = ?";
		List<ProductModel> product = query(sql, new ProductMapper(), id);
		return product.isEmpty() ? null : product.get(0);
	}

	@Override
	public List<ProductModel> findAll() {
		StringBuilder sql = new StringBuilder("select * from product");
		return query(sql.toString(), new ProductMapper());
	}

	@Override
	public Long save(ProductModel model) {
		StringBuilder sql = new StringBuilder("INSERT INTO product (name, origin_price,");
		sql.append(" sale_price, image,");
		sql.append(" brand, categoryid,");
		sql.append(" wire_type, status,");
		sql.append(" glass_surface, material_case,");
		sql.append(" size, guarantee,");
		sql.append(" trademark, sex,");
		sql.append(" createddate, modifieddate,");
		sql.append(" createdby, modifiedby)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), model.getName(), model.getOrigin_price(), model.getSale_price(),
				model.getImage(), model.getBrand(), model.getCategoryid(), model.getWire_type(), model.getStatus(),
				model.getGlass_surface(), model.getMaterial_case(), model.getSize(), model.getGuarantee(),
				model.getTrademark(), model.getSex(), model.getCreatedDate(), model.getModifiedDate(),
				model.getCreatedBy(), model.getModifiedBy()) ;
	}

	@Override
	public void update(ProductModel model) {
		StringBuilder sql = new StringBuilder("UPDATE product SET name = ?, origin_price = ?,");
		sql.append(" sale_price = ?, image = ?, brand = ?, categoryid = ?, ");
		sql.append(" wire_type = ?, status = ?, glass_surface = ?, material_case = ?, ");
		sql.append(" size = ?, guarantee = ?, trademark = ?, sex = ?, ");
		sql.append(" createddate = ?, modifieddate = ?, createdby = ?, modifiedby = ? WHERE id = ? ");
		update(sql.toString(), model.getName(), model.getOrigin_price(), model.getSale_price(),
				model.getImage(), model.getBrand(), model.getCategoryid(), model.getWire_type(), model.getStatus(),
				model.getGlass_surface(), model.getMaterial_case(), model.getSize(), model.getGuarantee(),
				model.getTrademark(), model.getSex(), model.getCreatedDate(), model.getModifiedDate(),
				model.getCreatedBy(), model.getModifiedBy(), model.getId());
		
	}

	@Override
	public void delete(long id) {
		String sql = "delete from product where id = ?";
		update(sql, id);
	}

}
