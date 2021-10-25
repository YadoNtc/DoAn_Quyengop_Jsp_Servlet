package dao.ipml;

import java.util.List;

import dao.IUserDao;
import dao.mapper.UserMapper;
import model.UserModel;

public class UserDao extends AbstractDao<UserModel> implements IUserDao{

	@Override
	public Long save(UserModel userModel) {
		StringBuilder sql = new StringBuilder("INSERT INTO dbo.users ");
		sql.append("(avatar, password, fullname, email, address, phonenumber, createddate, hash, idgg, createdby, status, admin, idfb) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), userModel.getAvatar(), userModel.getPassword(), userModel.getFullName(), userModel.getEmail(),
				userModel.getAddress(), userModel.getMobile(), userModel.getCreatedDate(), userModel.getMyhash(), userModel.getIdgg(),
				userModel.getCreatedBy(), userModel.isStatus(), userModel.isAdmin(), userModel.getIdfb());
	}

	@Override
	public List<UserModel> findAll() {
		String sql = "SELECT * FROM dbo.users";
		return query(sql, new UserMapper());
	}

	@Override
	public UserModel findOne(Long id) {
		String sql = "SELECT * FROM dbo.users WHERE id = ?";
		List<UserModel> userModels = query(sql, new UserMapper(), id);
		return userModels.isEmpty() ? null : userModels.get(0);
	}

	@Override
	public void update(UserModel updateModel) {
		StringBuilder sql = new StringBuilder("UPDATE dbo.users SET ");
		sql.append("avatar = ?, password = ?, fullname = ?, email = ?, address = ?, phonenumber = ?, createddate = ?, ");
		sql.append("createdby = ?, status = ?, admin = ?, modifieddate = ?, modifiedby = ? WHERE  id = ?");
		update(sql.toString(), updateModel.getAvatar(), updateModel.getPassword(), updateModel.getFullName(), updateModel.getEmail(),
				updateModel.getAddress(), updateModel.getMobile(), updateModel.getCreatedDate(), updateModel.getCreatedBy(), updateModel.isStatus(),
				updateModel.isAdmin(), updateModel.getModifiedDate(), updateModel.getModifiedBy(), updateModel.getId());
		
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM dbo.users WHERE id = ?";
		update(sql, id);
	}

	@Override
	public UserModel findAccount(String email, String password, boolean status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.users ");
		sql.append("WHERE email = ? AND password = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), email, password, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserModel findAcByEmailAndHash(String email, String hash, boolean status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.users ");
		sql.append("WHERE email = ? AND hash = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), email, hash, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public void updateActiveAccount(UserModel userModel) {
		String sql = "UPDATE dbo.users SET status = 1 WHERE email = ? AND hash = ?";
		update(sql, userModel.getEmail(), userModel.getMyhash());
		
	}

	@Override
	public UserModel findByIdGg(String email, String idgg, boolean status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.users ");
		sql.append("WHERE email = ? AND idgg = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), email, idgg, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public UserModel findByIdFb(String email, String idFb, boolean status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.users ");
		sql.append("WHERE email = ? AND idfb = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), email, idFb, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public void changePassword(String email, String oldPassword, String newPassword) {
		StringBuilder sql = new StringBuilder("UPDATE dbo.users SET password = ?");
		sql.append("WHERE email = ? AND ");
		update(sql.toString(), email, oldPassword, newPassword);
		
	}

	@Override
	public UserModel findByEmail(String emailAddress) {
		StringBuilder sql = new StringBuilder("SELECT * FROM dbo.users ");
		sql.append("WHERE email = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), emailAddress);
		return users.isEmpty() ? null : users.get(0);
	}

}
