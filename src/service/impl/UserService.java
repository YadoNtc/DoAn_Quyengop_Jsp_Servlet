package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.IUserDao;
import model.UserModel;
import service.IUserService;

public class UserService implements IUserService {
	
	@Inject
	private IUserDao userDao;

	@Override
	public UserModel save(UserModel userModel) {
		userModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		Long userId = userDao.save(userModel);
		return userDao.findOne(userId);
	}

	@Override
	public List<UserModel> findAll() {
		return userDao.findAll();
	}

	@Override
	public UserModel findOne(Long id) {
		return userDao.findOne(id);
	}

	@Override
	public UserModel update(UserModel updateModel) {
		//UserModel oldModel = findOne(updateModel.getId());
		
		updateModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		
		userDao.update(updateModel);
		return updateModel;
	}

	@Override
	public void delete(Long[] ids) {
		for (Long id : ids) {
			userDao.delete(id);
		}	
	}

	@Override
	public void deleteById(Long id) {
		userDao.delete(id);		
	}

	@Override
	public UserModel findAccount(String email, String password, boolean status) {		
		return userDao.findAccount(email, password, status);
	}

	@Override
	public UserModel findAcByEmailAndHash(String email, String hash, boolean status) {
		return userDao.findAcByEmailAndHash(email, hash, status);
	}

	@Override
	public UserModel updateActiveAccount(UserModel userModel) {
		userDao.updateActiveAccount(userModel);
		return userModel;			
	}

	@Override
	public UserModel findByIdGg(String email, String idGg, boolean status) {
		return userDao.findByIdGg(email, idGg, status);
	}

	@Override
	public UserModel findByIdFb(String email, String idFb, boolean status) {
		return userDao.findByIdFb(email, idFb, status);
	}

	@Override
	public UserModel findByEmail(String emailAddress) {
		return userDao.findByEmail(emailAddress);
	}

}
