package dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.DonateDetailModel;

public class DonateDetailMapper implements IRowMapper<DonateDetailModel> {

	@Override
	public DonateDetailModel mapRow(ResultSet resultSet) {
		DonateDetailModel detailModel = new DonateDetailModel();
		try {
			detailModel.setId(resultSet.getLong("id"));
			detailModel.setCampaginId(resultSet.getLong("campaginId"));
			detailModel.setUserId(resultSet.getLong("userId"));
			detailModel.setAmoutMoney(resultSet.getLong("amoutmoney"));
			detailModel.setFullName(resultSet.getString("fullname"));
			detailModel.setEmail(resultSet.getString("email"));
			detailModel.setMobile(resultSet.getString("mobile"));
			detailModel.setStatus(resultSet.getString("status"));
			detailModel.setCreatedDate(resultSet.getTimestamp("createddate"));
			return detailModel;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
