package ssm.car.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ssm.car.bean.Car;
import ssm.car.bean.Comment;
import ssm.car.bean.OrderDetail;
import ssm.car.bean.Tcomment;
import ssm.car.bean.Topic;
import ssm.car.service.ICarService;
import ssm.car.service.ICommentService;
import ssm.car.service.IOrderDetailService;
import ssm.car.service.ITcommentService;
import ssm.car.service.ITopicService;
import ssm.car.util.Constant;

//ÖÐÍ¾Ìø×ªµÄservlet
@Controller
public class TcommentController {
	@Resource 
	private ITcommentService TcommentService;
	@Resource
	private ITopicService topicService;

	
	@RequestMapping(value="/tcommentPage")
	public String tcommentPage(Integer tid,Model model){
		Topic topic =topicService.findById(tid);
		model.addAttribute("Topic",topic);

		return "front/tcomment";
	}
	@ResponseBody
	@RequestMapping("/addTcomment")
	public String addTcomment(Integer uid,Integer tid,String tccontent,String tcimg,String tcintro,String tcname){
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String dateStr=sdf.format(date);
		Tcomment tcomment = new Tcomment();
		tcomment.setUid(uid);
		tcomment.setTid(tid);
		tcomment.setTcdate(dateStr);
		tcomment.setTccontent(tccontent);
		tcomment.setTcimg(tcimg);
		tcomment.setTcname(tcname);
		tcomment.setTcintro(tcintro);
		
		TcommentService.insert(tcomment);
		
		return "success";
	}
}
