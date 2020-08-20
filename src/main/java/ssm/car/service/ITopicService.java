package ssm.car.service;

import java.util.List;
import java.util.Set;

import ssm.car.bean.Topic;

public interface ITopicService {
	int addTopic(Topic topic);
	
	List<Topic> findAllTopic();

	Set<String> TopicType();
	
	void mantopic();

	Topic findById(Integer tid);
	

}
