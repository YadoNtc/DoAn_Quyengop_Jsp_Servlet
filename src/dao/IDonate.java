package dao;

import java.util.List;

import model.DonateModel;

public interface IDonate extends IGenericDao<DonateModel>{
	
	Long save(DonateModel donateModel);
	
	DonateModel findOne(Long id);
	
	List<DonateModel> finfAll();
	List<DonateModel> findById(Long id);
	
	int countTotalItem();
	int countTotalItemCompleted();
	int countTotalCampagin();
	
	void update(DonateModel donateModel);
	
	void delete(Long id);

	void updateCurrentMoney(Long id);

}
