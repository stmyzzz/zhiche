package ssm.car.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ssm.car.bean.Car;
import ssm.car.bean.Comment;
import ssm.car.bean.OrderDetail;
import ssm.car.service.ICarService;
import ssm.car.service.ICommentService;
import ssm.car.service.IOrderDetailService;
import ssm.car.util.Constant;

@Controller
public class CommentController {
	@Resource 
	private ICarService CarService;
	@Resource
	private ICommentService commentService;
	@Resource
	private IOrderDetailService orderDetailService;
	
	@RequestMapping("/commentPage")
	public String commentPage(Integer odid,Integer bid,Model model){
		Car Car = CarService.findById(bid);
		model.addAttribute("Car", Car);
		model.addAttribute("odid", odid);
		return "front/comment";
	}
	@RequestMapping("/addComment")
	public ModelAndView addComment(Integer uid,Integer odid,Integer bid,String uname,String content){
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String dateStr=sdf.format(date);
		Comment comment = new Comment();
		comment.setBid(bid);
		comment.setUname(uname);
		comment.setDate(dateStr);
		comment.setContent(content);
		commentService.insert(comment);
		OrderDetail orderDetail =orderDetailService.selectByPrimaryKey(odid);
		orderDetail.setId(odid);
		orderDetail.setStatus(Constant.EN_COMMENT);
		orderDetailService.updateByPrimaryKey(orderDetail);
		return new ModelAndView("redirect:/userOrder.do?uid="+uid+"");
	}
}
