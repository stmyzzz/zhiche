package ssm.car.service;

import java.util.List;

import ssm.car.bean.User;



public interface IUserService {
	
	boolean userReg(User user);
	
	User userLogin(User user);
	
	List<User> findAllUser();
	
	int userModify(User user);
	
	User findUserById(Integer uid);
	
	int deleteById(Integer uid);
	
	int addUser(User user);
	
	boolean updatePwd(Integer uid,String password,String newPassword);
}
