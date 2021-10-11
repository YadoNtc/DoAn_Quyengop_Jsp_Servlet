package dao;

import java.util.List;

import model.UserModel;

public interface IUserDao {
	
	Long save(UserModel userModel);
	
	List<UserModel> findAll();
	
	UserModel findOne(Long id);
	
	void update(UserModel updateModel);
	
	void delete(Long id);
	
	UserModel findAccount(String email, String password, boolean status);
	
	UserModel findByIdGg(String email, String idgg, boolean status);
	UserModel findByIdFb(String email, String idfb, boolean status);
	
	UserModel findAcByEmailAndHash(String email, String hash, boolean status);
	
	void updateActiveAccount(UserModel userModel);
}
