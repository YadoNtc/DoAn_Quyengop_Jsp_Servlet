package dao;

import java.util.List;

import model.DonateModel;
import paging.Pageable;

public interface IDonate extends IGenericDao<DonateModel>{
	
	Long save(DonateModel donateModel);
	
	DonateModel findOne(Long id);
	
	List<DonateModel> finfAll(Pageable pageable);
	
	List<DonateModel> finfAll();
	List<DonateModel> findById(Long id);
	
	int countTotalItem();
	int countTotalItemCompleted();
	int countTotalCampagin();
	
	void update(DonateModel donateModel);
	
	void delete(Long id);

	void updateCurrentMoney(Long id);

}
