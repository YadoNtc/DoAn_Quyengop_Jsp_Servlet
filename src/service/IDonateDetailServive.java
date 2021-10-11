package service;

import java.util.List;

import model.DonateDetailModel;

public interface IDonateDetailServive {
	
	DonateDetailModel save(DonateDetailModel detailModel);
	
	DonateDetailModel findOne(Long id);

	List<DonateDetailModel> findAll();
	
	List<DonateDetailModel> findByUserId(Long id);

	DonateDetailModel update(DonateDetailModel detailModel);

	void deleteById(Long id);

	int countTotalCampaigin(Long id);

	int coutTotalAmout(Long id);
	
}
