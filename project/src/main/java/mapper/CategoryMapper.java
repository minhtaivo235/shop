package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.CategoryModel;

public class CategoryMapper implements RowMapper<CategoryModel> {

	public CategoryModel mapRow(ResultSet resultSet) {
		try {
			CategoryModel category = new CategoryModel();
			category.setId(resultSet.getLong("id"));
			category.setName(resultSet.getString("name"));
			category.setCode(resultSet.getString("code"));						
			category.setCreatedDate(resultSet.getTimestamp("createdDate"));
			category.setModifiedDate(resultSet.getTimestamp("modifiedDate"));
			category.setCreatedBy(resultSet.getString("createdBy"));		
			category.setModifiedBy(resultSet.getString("modifiedBy"));

			return category;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
