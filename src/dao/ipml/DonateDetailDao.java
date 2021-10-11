package dao.ipml;

import java.util.List;

import dao.IDonateDetailDao;
import dao.mapper.DonateDetailMapper;
import model.DonateDetailModel;

public class DonateDetailDao extends AbstractDao<DonateDetailModel> implements IDonateDetailDao {

	@Override
	public Long save(DonateDetailModel detailModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO dbo.dotquyengop ");
		sql.append("(amoutmoney, createddate, userId, campaginId, fullname, email, mobile, status) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), detailModel.getAmoutMoney(), detailModel.getCreatedDate(), detailModel.getUserId(), 
				detailModel.getCampaginId(), detailModel.getFullName(), detailModel.getEmail(), detailModel.getMobile(),
				detailModel.getStatus());
	}

	@Override
	public DonateDetailModel findOne(Long id) {
		String sql = "SELECT * FROM dbo.dotquyengop WHERE id = ?";
		List<DonateDetailModel> detailModels = query(sql, new DonateDetailMapper(), id);
		return detailModels.isEmpty() ? null : detailModels.get(0);
	}

	@Override
	public List<DonateDetailModel> findAll() {
		String sql = "SELECT * FROM dbo.dotquyengop";
		return query(sql, new DonateDetailMapper());
	}

	@Override
	public void update(DonateDetailModel detailModel) {
		StringBuilder sql = new StringBuilder("UPDATE dbo.dotquyengop SET ");
		sql.append("amoutmoney = ?, createddate = ?, userId = ?, campaginId = ?, ");
		sql.append("fullname = ?, email = ?, mobile = ?, status = ?, modifieddate = ? WHERE id = ?");
		update(sql.toString(), detailModel.getAmoutMoney(), detailModel.getCreatedDate(), detailModel.getUserId(),
				detailModel.getCampaginId(), detailModel.getFullName(), detailModel.getEmail(), 
				detailModel.getMobile(), detailModel.getStatus(), detailModel.getModifiedDate(), detailModel.getId());
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM dbo.dotquyengop WHERE id = ?";
		update(sql, id);
		
	}

	@Override
	public int countCampagin(Long id) {
		String sql = "SELECT COUNT(*) FROM dbo.dotquyengop WHERE campaginId = ?";
		return count(sql, id);
	}
	
	@Override
	public List<DonateDetailModel> findByUserId(Long id) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.dotquyengop AS dqg, dbo.chuongtrinhquyengop AS ctqg ");
		sql.append("WHERE ctqg.id = dqg.campaginId AND dqg.userId = ?");
		return query(sql.toString(), new DonateDetailMapper(), id);
	}

	@Override
	public int coutTotalAmout(Long id) {
		String sql = "SELECT SUM(amoutmoney) FROM dbo.dotquyengop WHERE userId = ?";
		return count(sql, id);
	}

}
