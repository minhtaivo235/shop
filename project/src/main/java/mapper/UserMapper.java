package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.RoleModel;
import model.UserModel;


public class UserMapper implements RowMapper<UserModel> {


	public UserModel mapRow(ResultSet resultSet) {
		try {
			UserModel user = new UserModel();
			user.setId(resultSet.getLong("id"));
			user.setUsername(resultSet.getString("username"));
			user.setPassword(resultSet.getString("password"));			
			user.setFullname(resultSet.getString("fullname"));
			user.setPhone(resultSet.getString("phone"));
			user.setEmail(resultSet.getString("email"));
			user.setStatus(resultSet.getInt("status"));
			try {
				RoleModel role = new RoleModel();
				role.setCode(resultSet.getString("code"));
				role.setName(resultSet.getString("name"));
				user.setRole(role);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			user.setRoleid(resultSet.getLong("roleid"));
			user.setCreatedDate(resultSet.getTimestamp("createdDate"));
			user.setModifiedDate(resultSet.getTimestamp("modifiedDate"));
			user.setCreatedBy(resultSet.getString("createdBy"));		
			user.setModifiedBy(resultSet.getString("modifiedBy"));
			return user;
		} catch (SQLException e) {
			return null;
		}	
	}
}
