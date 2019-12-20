package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel> {

	@Override
	public ProductModel mapRow(ResultSet rs) {
		try {
			ProductModel product = new ProductModel();
			product.setId(rs.getLong("id"));
			product.setName(rs.getString("name"));
			product.setOrigin_price(rs.getInt("origin_price"));
			product.setSale_price(rs.getInt("sale_price"));
			product.setImage(rs.getString("image"));
			product.setBrand(rs.getString("brand"));
			product.setCategoryid(rs.getLong("categoryid"));
			product.setWire_type(rs.getString("wire_type"));
			product.setStatus(rs.getString("status"));
			product.setGlass_surface(rs.getString("glass_surface"));
			product.setMaterial_case(rs.getString("material_case"));
			product.setSize(rs.getString("size"));
			product.setGuarantee(rs.getString("guarantee"));
			product.setTrademark(rs.getString("trademark"));
			product.setSex(rs.getString("sex"));
			product.setCreatedDate(rs.getTimestamp("createdDate"));
			product.setModifiedDate(rs.getTimestamp("modifiedDate"));
			product.setCreatedBy(rs.getString("createdBy"));		
			product.setModifiedBy(rs.getString("modifiedBy"));
			return product;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
