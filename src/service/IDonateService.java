package service;

import java.util.List;

import model.DonateModel;

public interface IDonateService {

	DonateModel save(DonateModel donateModel);
	
	List<DonateModel> findAll();
	
	int countTotalItem();
	
	DonateModel findOne(Long id);
	
	DonateModel update(DonateModel updateDonate);
	
	void delete(Long[] ids);

	int countTotalItemCompleted();

	int countTotalCampagin();

	void updateCurrentMoney(Long id);

	List<DonateModel> findById(Long id);

}
