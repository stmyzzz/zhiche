package ssm.car.service;

import java.util.List;

import ssm.car.bean.Comment;


public interface ICommentService {
	int insert(Comment record);
	
	List<Comment> selectBybid(Integer bid);
}
