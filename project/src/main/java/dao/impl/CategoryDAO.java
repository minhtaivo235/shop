package dao.impl;


import java.util.List;


import dao.ICategoryDAO;
import mapper.CategoryMapper;
import model.CategoryModel;
import paging.IPageble;

public class CategoryDAO  extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	public List<CategoryModel> findAll(IPageble pageable) {
		StringBuilder sql = new StringBuilder("select * from category");
		if(pageable.getSorter() != null) {
			sql.append(" order by "+ pageable.getSorter().getSortName() +" "+ pageable.getSorter().getSortBy() +" ");
		}
		if (pageable.getOffset() != null && pageable.getLimit() != null) {
			sql.append("limit "+pageable.getOffset()+","+pageable.getLimit()+"");
						
		}
		return query(sql.toString(), new CategoryMapper());
	}

	public CategoryModel findOne(Long id) {
		String sql = "select * from category where id = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), id);
		return category.isEmpty() ? null : category.get(0);
	}

	public CategoryModel findOneByCode(String code) {
		String sql = "select * from category where code = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), code);
		return category.isEmpty() ? null : category.get(0);
	}

	public Long save(CategoryModel categoryModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO category (name, code,");
		sql.append(" createddate, createdby)");
		sql.append(" VALUES(?, ?, ?, ?)");
		return insert(sql.toString(), categoryModel.getName(), categoryModel.getCode(), categoryModel.getCreatedDate()
				, categoryModel.getCreatedBy()) ;
	}

	public void update(CategoryModel categoryModel) {
		StringBuilder sql = new StringBuilder("UPDATE category SET name = ?, code = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), categoryModel.getName(), categoryModel.getCode(), categoryModel.getCreatedDate(),
				categoryModel.getCreatedBy(), categoryModel.getModifiedDate(), categoryModel.getModifiedBy(), categoryModel.getId());
		
	}


	public void delete(long id) {
		String sql = "delete from category where id = ?";
		update(sql, id);
		
	}

	@Override
	public int getTotalItem() {
		String sql = "select count(*) from category";
		return count(sql);
	}

	@Override
	public List<CategoryModel> findAll() {
		StringBuilder sql = new StringBuilder("select * from category");
		return query(sql.toString(), new CategoryMapper());
	}


}
