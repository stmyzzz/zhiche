package ssm.car.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ssm.car.bean.Car;
import ssm.car.bean.CarOrder;
import ssm.car.bean.CarOrderExample;
import ssm.car.bean.Cart;
import ssm.car.bean.OrderDetail;
import ssm.car.bean.OrderDetailExample;
import ssm.car.bean.CarOrderExample.Criteria;
import ssm.car.service.ICarOrderService;
import ssm.car.service.ICarService;
import ssm.car.service.IOrderDetailService;
import ssm.car.util.Constant;

@Controller
public class CarOrderController {
	
	@Resource 
	private ICarService CarService;
	@Resource
	private ICarOrderService CarOrderService;
	@Resource
	private IOrderDetailService orderDetailService;
	
	@RequestMapping("/addCarOrder")
	public ModelAndView addOrder(Integer uid,String oname,String ocity,String oaddress,HttpSession session){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr=sdf.format(date);
		int oid;
		CarOrder CarOrder=new CarOrder();
		CarOrder.setDate(dateStr);
		CarOrder.setOname(oname);
		CarOrder.setAdress(ocity + " " + oaddress);
		CarOrder.setStatus(Constant.UN_DO);
		CarOrder.setUid(uid);
		CarOrderService.addCarOrder(CarOrder);
		CarOrderExample example = new CarOrderExample();
		Criteria cri = example.createCriteria();
		cri.andDateEqualTo(dateStr);
		oid = CarOrderService.selectOid(example);
		Cart cart =(Cart)session.getAttribute("cart");
		Map<Car, Integer> map=cart.getGoods();
		Iterator<Entry<Car, Integer>> iter = map.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<Car, Integer> entry = (Entry<Car, Integer>) iter.next();
			Car Car = entry.getKey();
			Integer number = entry.getValue();
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(oid);
			orderDetail.setcarId(Car.getBid());
			orderDetail.setcarNum(number);
			orderDetail.setStatus(Constant.UN_COMMENT);
			orderDetailService.addOrderDetail(orderDetail);
			CarService.reduceStore(Car.getBid(), number);
			}
		session.removeAttribute("cart");
		return new ModelAndView("redirect:/shoppingResult.do");
	}
	@RequestMapping("/allCarOrder")
	public String allCarOrder(Model model,Integer pageNum,String oname,Integer oid,HttpSession session){
		Set<Car> Cars=new HashSet<>();
		OrderDetailExample example2 = new OrderDetailExample();
		List<OrderDetail> orderDetails = orderDetailService.selectByExample(example2);
		for(OrderDetail od:orderDetails){
			Car Car = CarService.findById(od.getcarId());
			Cars.add(Car);
		}
		CarOrderExample boexample = (CarOrderExample) session.getAttribute("boexample");
		if(boexample==null){
			boexample= new CarOrderExample();
		}
		if(oid!=null){
			boexample.clear();
			Criteria cri = boexample.createCriteria();
			cri.andOidEqualTo(oid);
		}
		if(oname!=null){
			boexample.clear();
			Criteria cri = boexample.createCriteria();
			cri.andOnameLike("%"+oname+"%");
		}
		session.setAttribute("boexample", boexample);
		if(pageNum!=null){
			PageHelper.startPage(pageNum,ssm.car.util.Constant.UO_PAGE_SIZE,"date desc");
		}else{
			PageHelper.startPage(1, ssm.car.util.Constant.UO_PAGE_SIZE,"date desc");
		}
		List<CarOrder> CarOrders = CarOrderService.selectByExample(boexample);
		PageInfo<CarOrder> pageInfo = new PageInfo<CarOrder>(CarOrders);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("CarOrders", CarOrders);
		model.addAttribute("Cars", Cars);
		model.addAttribute("orderDetails", orderDetails);
		return "manage/order";
	}
	@RequestMapping("/delserchCarOrder")
	public ModelAndView delserchCarOrder(Integer oid){
		CarOrderService.deleteByPrimaryKey(oid);
		orderDetailService.deleteByOid(oid);
		return new ModelAndView("redirect:/CarOrder.do");
	}
	@RequestMapping("/orderModify")
	public ModelAndView orderModify(Integer oid,String oname,String address,String status){
		CarOrder CarOrder = new CarOrder();
		CarOrder.setOid(oid);
		CarOrder.setOname(oname);
		CarOrder.setAdress(address);
		CarOrder.setStatus(status);
		CarOrderService.update(CarOrder);
		return new ModelAndView("redirect:/CarOrder.do");
	}
	@RequestMapping("/orderModifyPage")
	public String orderModifyPage(Integer oid,Model model){
		CarOrder CarOrder = CarOrderService.selectByPrimaryKey(oid);
		model.addAttribute("CarOrder", CarOrder);
		return "manage/order-modify";
	}

	@RequestMapping("/CarOrder")
	public ModelAndView CarOrder(Model model, @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum, String oname, Integer oid, HttpSession session) {
		Set<Car> Cars = new HashSet<>();
        CarOrderExample CarOrderExample = new CarOrderExample();
        Criteria cri = CarOrderExample.createCriteria();

        if(oid!=null){
            cri.andOidEqualTo(oid);
        }
        session.setAttribute("oid",oid);

        if(StringUtils.isNotEmpty(oname)){
            cri.andOnameLike("%"+oname+"%");
        }
        session.setAttribute("oname",oname);
		PageHelper.startPage(pageNum, ssm.car.util.Constant.UO_PAGE_SIZE,"date desc");
		List<CarOrder> CarOrders = CarOrderService.selectByExample(CarOrderExample);
		for (CarOrder CarOrder : CarOrders) {
			OrderDetailExample orderDetailExample = new OrderDetailExample();
			OrderDetailExample.Criteria detailExampleCriteria = orderDetailExample.createCriteria();
			detailExampleCriteria.andOrderIdEqualTo(CarOrder.getOid());
			List<OrderDetail> orderDetails = orderDetailService.selectByExample(orderDetailExample);
			for (OrderDetail orderDetail : orderDetails) {
				Cars.add(CarService.findById(orderDetail.getcarId()));
			}
			CarOrder.setOrderDetails(orderDetails);
		}
		PageInfo<CarOrder> pageInfo = new PageInfo<>(CarOrders);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("CarOrders", CarOrders);
		model.addAttribute("Cars", Cars);
		
		return new ModelAndView("/manage/order","model",model);
	}


}
