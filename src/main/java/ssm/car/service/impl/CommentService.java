package ssm.car.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.car.bean.Comment;
import ssm.car.bean.CommentExample;
import ssm.car.bean.CommentExample.Criteria;
import ssm.car.mapper.CommentMapper;
import ssm.car.service.ICommentService;

@Service
public class CommentService implements ICommentService{
	
	@Resource
	private CommentMapper commentMapper;

	@Override
	public int insert(Comment record) {
		// TODO Auto-generated method stub
		return commentMapper.insert(record);
	}

	@Override
	public List<Comment> selectBybid(Integer bid) {
		// TODO Auto-generated method stub
		CommentExample example = new CommentExample();
		Criteria cri = example.createCriteria();
		cri.andBidEqualTo(bid);
		return commentMapper.selectByExample(example);
	}


}
