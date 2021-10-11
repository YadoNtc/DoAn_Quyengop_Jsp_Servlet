package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.IDonateDetailDao;
import model.DonateDetailModel;
import service.IDonateDetailServive;

public class DonateDetailService implements IDonateDetailServive{
	
	@Inject
	private IDonateDetailDao donateDao;

	@Override
	public DonateDetailModel save(DonateDetailModel detailModel) {
		detailModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long id = donateDao.save(detailModel);
		return donateDao.findOne(id);
	}

	@Override
	public DonateDetailModel findOne(Long id) {
		return donateDao.findOne(id);
	}

	@Override
	public List<DonateDetailModel> findAll() {
		return donateDao.findAll();
	}

	@Override
	public DonateDetailModel update(DonateDetailModel detailModel) {
		detailModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		donateDao.update(detailModel);
		return detailModel;
		
	}

	@Override
	public void deleteById(Long id) {
		donateDao.delete(id);	
	}

	@Override
	public int countTotalCampaigin(Long id) {
		return donateDao.countCampagin(id);
	}

	@Override
	public List<DonateDetailModel> findByUserId(Long id) {
		return donateDao.findByUserId(id);
	}

	@Override
	public int coutTotalAmout(Long id) {
		return donateDao.coutTotalAmout(id);
	}

}
