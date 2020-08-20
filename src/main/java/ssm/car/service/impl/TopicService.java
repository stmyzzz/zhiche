package ssm.car.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.car.bean.Topic;
import ssm.car.bean.TopicExample;
import ssm.car.mapper.TopicMapper;
import ssm.car.service.ITopicService;

@Service
public class TopicService implements ITopicService{

	@Resource
	private TopicMapper TopicMapper;
	

	@Override
	public int addTopic(Topic topic) {
		return TopicMapper.insert(topic);
	}

	@Override
	public List<Topic> findAllTopic() {
		TopicExample example=new TopicExample();
		example.setOrderByClause("tid desc");
		List<Topic> topics=TopicMapper.selectByExample(example);
//		List<Car> Cars=CarMapper.getAllCars();
		return topics;
	}

	@Override
	public Set<String> TopicType() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void mantopic() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public Topic findById(Integer tid) {
		// TODO Auto-generated method stub
				return TopicMapper.selectByPrimaryKey(tid);
	}



}
