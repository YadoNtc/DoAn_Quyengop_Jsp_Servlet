package service;

import java.util.List;

import model.UserModel;

public interface IUserService {
	
	UserModel save(UserModel userModel);
	
	List<UserModel> findAll();
	
	UserModel findOne(Long id);
	
	UserModel update(UserModel updateModel);
	
	void delete(Long[] ids);
	
	void deleteById(Long id);
	
	UserModel findAccount(String email, String password, boolean status);
	
	UserModel findByIdGg(String email, String idGg, boolean status);
	UserModel findByIdFb(String email, String idFb, boolean status);
	
	UserModel findAcByEmailAndHash(String email, String hash, boolean status);
	
	UserModel updateActiveAccount(UserModel userModel);

	UserModel findByEmail(String emailAddress);
	
	
}
