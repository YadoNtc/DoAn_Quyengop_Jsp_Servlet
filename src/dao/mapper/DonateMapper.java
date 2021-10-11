package dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.DonateModel;

public class DonateMapper implements IRowMapper<DonateModel> {

	@Override
	public DonateModel mapRow(ResultSet resultSet) {
		DonateModel model = new DonateModel();
		try {
			model.setId(resultSet.getLong("id"));
			model.setName(resultSet.getString("name"));
			model.setDescription(resultSet.getString("description"));
			model.setImage(resultSet.getString("image"));
			model.setDetail(resultSet.getString("detail"));
			model.setCreatedDate(resultSet.getTimestamp("createddate"));
			model.setCreatedBy(resultSet.getString("createdby"));
			model.setTargetMoney(resultSet.getLong("targetmoney"));
			model.setCurrentMoney(resultSet.getLong("currentmoney"));
			model.setStatus(resultSet.getString("status"));
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
