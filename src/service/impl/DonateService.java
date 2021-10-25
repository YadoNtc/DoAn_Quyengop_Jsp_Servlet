package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.IDonate;
import model.DonateModel;
import service.IDonateService;

public class DonateService implements IDonateService {
	
	@Inject
	private IDonate donateDao;

	@Override
	public DonateModel save(DonateModel donateModel) {
		donateModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long donateId = donateDao.save(donateModel);
		return donateDao.findOne(donateId);
	}

	@Override
	public int countTotalItem() {
		return donateDao.countTotalItem();
	}

	@Override
	public DonateModel findOne(Long id) {
		DonateModel model = donateDao.findOne(id);
		return model;
	}

	@Override
	public DonateModel update(DonateModel updateDonate) {
		DonateModel oldDonateModel = findOne(updateDonate.getId());
		
		updateDonate.setCreatedDate(oldDonateModel.getCreatedDate());
		updateDonate.setCreatedBy(oldDonateModel.getCreatedBy());
		
		updateDonate.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		
		donateDao.update(updateDonate);
		
		return updateDonate;
	}

	@Override
	public List<DonateModel> findAll() {
		return donateDao.finfAll();
	}

	@Override
	public void delete(Long[] ids) {
		for (Long id: ids) {
			donateDao.delete(id);
		}		
	}

	@Override
	public int countTotalItemCompleted() {
		return donateDao.countTotalItemCompleted();
	}

	@Override
	public int countTotalCampagin() {
		return donateDao.countTotalCampagin();
	}

	@Override
	public void updateCurrentMoney(Long id) {
		donateDao.updateCurrentMoney(id);
	}

	@Override
	public List<DonateModel> findById(Long id) {
		return donateDao.findById(id);
	}

}
