package dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.UserModel;

public class UserMapper implements IRowMapper<UserModel>{

	@Override
	public UserModel mapRow(ResultSet resultSet) {
		UserModel model = new UserModel();
		try {
			model.setId(resultSet.getLong("id"));
			model.setAvatar(resultSet.getString("avatar"));
			model.setPassword(resultSet.getString("password"));
			model.setFullName(resultSet.getString("fullname"));
			model.setEmail(resultSet.getString("email"));
			model.setAddress(resultSet.getString("address"));
			model.setMobile(resultSet.getString("phonenumber"));
			model.setCreatedDate(resultSet.getTimestamp("createddate"));
			model.setStatus(resultSet.getBoolean("status"));
			model.setAdmin(resultSet.getBoolean("admin"));
			model.setMyhash(resultSet.getString("hash"));
			model.setIdgg(resultSet.getString("idgg"));
			model.setIdfb(resultSet.getString("idfb"));
			if (resultSet.getTimestamp("modifieddate") != null) {
				model.setModifiedDate(resultSet.getTimestamp("modifieddate"));
			}
			if (resultSet.getString("modifiedby") != null) {
				model.setModifiedBy(resultSet.getString("modifiedby"));
			}
			return model;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
