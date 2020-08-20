package ssm.car.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import ssm.car.bean.Tcomment;
import ssm.car.bean.TcommentExample;
import ssm.car.bean.TcommentExample.Criteria;
import ssm.car.mapper.TcommentMapper;

import ssm.car.service.ITcommentService;

@Service
public class TcommentService implements ITcommentService{
	
	@Resource
	private TcommentMapper tcommentMapper;

	@Override
	public int insert(Tcomment record) {
		// TODO Auto-generated method stub
		return tcommentMapper.insert(record);
	}


	@Override
	public List<Tcomment> selectBytid(Integer tid) {
		// TODO Auto-generated method stub
		TcommentExample example = new TcommentExample();
		Criteria cri = example.createCriteria();
		cri.andTidEqualTo(tid);
		return tcommentMapper.selectByExample(example);
	}


	@Override
	public Tcomment findById(Integer tid) {
		// TODO Auto-generated method stub
		return null;
	}






}
