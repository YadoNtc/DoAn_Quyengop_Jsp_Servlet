  package dao.ipml;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import dao.IDonate;
import dao.mapper.DonateMapper;
import model.DonateModel;
import paging.Pageable;

public class DonateDao extends AbstractDao<DonateModel> implements IDonate {

	@Override
	public Long save(DonateModel donateModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO dbo.chuongtrinhquyengop ");
		sql.append("(name, description, image, detail, targetmoney, createddate, createdby, status) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), donateModel.getName(), donateModel.getDescription(), donateModel.getImage(),
				donateModel.getDetail(), donateModel.getTargetMoney(),
				donateModel.getCreatedDate(), donateModel.getCreatedBy(), donateModel.getStatus());
	}

	@Override
	public DonateModel findOne(Long id) {
		String sql = "SELECT * FROM dbo.chuongtrinhquyengop WHERE id = ?";
		List<DonateModel> donateModel = query(sql, new DonateMapper(), id);
		return donateModel.isEmpty() ? null : donateModel.get(0);
	}

	@Override
	public int countTotalItem() {
		String sql = "SELECT COUNT(*) FROM dbo.chuongtrinhquyengop";
		return count(sql);
	}

	@Override
	public List<DonateModel> finfAll(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.chuongtrinhquyengop ");
		if (pageable.getSorter() != null && StringUtils.isNotBlank(pageable.getSorter().getSortName()) && StringUtils.isNotBlank(pageable.getSorter().getSortBy())) {
			sql.append("ORDER BY "+pageable.getSorter().getSortName()+" DESC ");
			sql.append("OFFSET " +pageable.getOffset()+" ROWS ");	
			sql.append("FETCH FIRST "+pageable.getLimit()+" ROWS ONLY");	
		}
		return query(sql.toString(), new DonateMapper());
	}

	@Override
	public void update(DonateModel donateModel) {
		StringBuilder sql = new StringBuilder("UPDATE dbo.chuongtrinhquyengop SET ");
		sql.append("name = ?, description = ?, image = ?, detail = ?, targetmoney = ?, createddate = ?, ");
		sql.append("createdby = ?, status = ?, modifieddate = ?, modifiedby = ? WHERE  id = ?");
		update(sql.toString(), donateModel.getName(), donateModel.getDescription(), donateModel.getImage(), donateModel.getDetail(),
				donateModel.getTargetMoney(), donateModel.getCreatedDate(), donateModel.getCreatedBy(),  
				donateModel.getStatus(), donateModel.getModifiedDate(), donateModel.getModifiedBy(), donateModel.getId());
	}

	@Override
	public List<DonateModel> finfAll() {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.chuongtrinhquyengop ");
		return query(sql.toString(), new DonateMapper());
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM dbo.chuongtrinhquyengop WHERE id = ?";
		update(sql, id);
		
	}

	@Override
	public int countTotalItemCompleted() {
		String sql = "SELECT COUNT(*) FROM dbo.chuongtrinhquyengop WHERE status = 'completed'";
		return count(sql);
	}

	@Override
	public int countTotalCampagin() {
		String sql = "SELECT COUNT(*) FROM dbo.dotquyengop";
		return count(sql);
	}

	@Override
	public void updateCurrentMoney(Long id) {
		String sql = "EXECUTE dbo.currentMoney ?";
		exceProcedure(sql, id);		
	}

	@Override
	public List<DonateModel> findById(Long id) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.chuongtrinhquyengop WHERE id = ?");
		return query(sql.toString(), new DonateMapper(), id);
	}
}
