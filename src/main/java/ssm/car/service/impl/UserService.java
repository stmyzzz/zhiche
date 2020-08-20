package ssm.car.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.car.bean.CarExample;
import ssm.car.bean.User;
import ssm.car.bean.UserExample;
import ssm.car.bean.UserExample.Criteria;
import ssm.car.mapper.UserMapper;
import ssm.car.service.IUserService;



@Service
public class UserService implements IUserService{
	
	@Resource
	private UserMapper userMapper;

	
	@Override
	public boolean userReg(User user) {
		// TODO Auto-generated method stub
//		UserExample userExample=new UserExample();
//		List<User> userList=userMapper.selectByExample(userExample);
//		for(User u:userList){
//			if (u.getUname().equals(user.getUname())){
//				return false;
//			}
//		}
		if(userMapper.insert(user)>0){
			return true;
		}
		return false;
	}

	@Override
	public User userLogin(User user) {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		Criteria cri = example.createCriteria();
		cri.andUnameEqualTo(user.getUname());
		List<User> users = userMapper.selectByExample(example);
		for(User u:users){
			if(u.getUname().equals(user.getUname())){
				if(u.getPassword().equals(user.getPassword())){
					return u;
				}
			}
		}
		return user;
	}

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		List<User> users = userMapper.selectByExample(example);
		return users;
	}

	@Override
	public int userModify(User user) {
		UserExample example=new UserExample();
		Criteria cri = example.createCriteria();
		cri.andUidEqualTo(user.getUid());
		return userMapper.updateByExampleSelective(user, example);
	}

	@Override
	public User findUserById(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(uid);
	}

	@Override
	public int deleteById(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(uid);
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.insert(user);
	}

	@Override
	public boolean updatePwd(Integer uid,String password, String newPassword) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria cri = example.createCriteria();
		cri.andUidEqualTo(uid);
		User user=userMapper.selectByPrimaryKey(uid);
		if(user.getPassword().equals(password)){
			user.setPassword(newPassword);
			userMapper.updateByPrimaryKeySelective(user);
			return true;
		}
		return false;
	}



}
