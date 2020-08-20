package ssm.car.controller;


import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ssm.car.bean.Car;
import ssm.car.bean.CarExample;
import ssm.car.bean.Comment;
import ssm.car.bean.Tcomment;
import ssm.car.bean.Topic;
import ssm.car.service.ICarService;
import ssm.car.service.ITcommentService;
import ssm.car.service.ITopicService;
import ssm.car.service.IUserService;
import ssm.car.service.impl.TopicService;



@Controller
public class TopicController {
	
	@Resource 
	private ITopicService topicService;
	
	@Resource 
	private ICarService CarService;
	


	@Resource 
	private ITcommentService tcommentService;
	
	@ResponseBody
	@RequestMapping("/addTopic")
	public String addTopic(Integer uid,String tname,String tcontent){
 
		Topic topic = new Topic();
	 
	    topic.setUid(uid);
	    topic.setTname(tname);
	    topic.setTcontent(tcontent);
	    
		topicService.addTopic(topic);
		return "success";
	}
	
	@RequestMapping("/manaTopic")
	public String manaTopic(Integer pageNum,Model model){
		if(pageNum!=null){
			PageHelper.startPage(pageNum,ssm.car.util.Constant.MB_PAGE_SIZE);
		}else{
			PageHelper.startPage(1, ssm.car.util.Constant.MB_PAGE_SIZE);
		}
		CarExample example = new CarExample();
		example.setOrderByClause("bid desc");
		List<Topic> topics = topicService.findAllTopic();
	
		List<Car> Cars = CarService.selectByExample(example);
		PageInfo<Topic> tpageInfo = new PageInfo<Topic>(topics);
		model.addAttribute("tpageInfo", tpageInfo);
		model.addAttribute("topics", topics);
		model.addAttribute("Cars", Cars);
		return "front/topic";
	}
	
	@RequestMapping("/TopicView")
	public String CarView(Integer pageNum,Integer tid,Model model,HttpServletRequest request,HttpServletResponse response){
		setCookies(tid, request, response);
		Topic Topic=topicService.findById(tid);
	    List<Topic> atopic = topicService.findAllTopic();
	    List<Car> acar = CarService.findAllCar();
		Set<String> bts=topicService.TopicType();
		List<Topic> TTopics =getCookies(request);
		if(pageNum!=null){
			PageHelper.startPage(pageNum, ssm.car.util.Constant.C_PAGE_SIZE);
		}else{
			PageHelper.startPage(1,  ssm.car.util.Constant.C_PAGE_SIZE);
		}
		List<Tcomment> tcomments = tcommentService.selectBytid(tid);
		PageInfo<Tcomment> pageInfo = new PageInfo<Tcomment>(tcomments);
		model.addAttribute("Ttopics", TTopics);
		model.addAttribute("bts", bts);
		model.addAttribute("Topic", Topic);
		model.addAttribute("atopic", atopic);
		model.addAttribute("acar", acar);
		model.addAttribute("tcomments", tcomments);
		model.addAttribute("pageInfo", pageInfo);


		return "front/topic-own";
	}

	private List<Topic> getCookies(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	private void setCookies(Integer tid, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
