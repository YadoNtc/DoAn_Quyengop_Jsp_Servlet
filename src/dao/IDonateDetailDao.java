package dao;

import java.util.List;

import model.DonateDetailModel;

public interface IDonateDetailDao extends IGenericDao<DonateDetailModel> {
	
	Long save(DonateDetailModel detailModel);
	
	DonateDetailModel findOne(Long id);

	List<DonateDetailModel> findAll();

	void update(DonateDetailModel detailModel);

	void delete(Long id);

	int countCampagin(Long id);

	List<DonateDetailModel> findByUserId(Long id);

	int coutTotalAmout(Long id);
	
}
