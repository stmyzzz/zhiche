package ssm.car.service;

import java.util.List;

import ssm.car.bean.Comment;
import ssm.car.bean.Tcomment;


public interface ITcommentService {
	int insert(Tcomment record);
	
	List<Tcomment> selectBytid(Integer tid);

	Tcomment findById(Integer uid);



}
