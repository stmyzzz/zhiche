package ssm.car.controller;

import ssm.car.bean.Car;
import ssm.car.bean.Cart;
import ssm.car.service.ICarService;
import ssm.car.service.ICartService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Map;


@Controller
public class CartController {

    @Resource
    private ICarService CarService;
    @Resource
    private ICartService cartService;

    //��ӵ����ﳵ  �洢��session
    @RequestMapping("/addGoodsInCart")
    public ModelAndView addGoodsInCart(Integer bid, Integer number, HttpSession session){
        Car Car=CarService.findById(bid);
        Cart cart=null;
        if(session.getAttribute("cart")!=null){
            cart=(Cart) session.getAttribute("cart");
        }else{
            cart=new Cart();
        }
        cart=cartService.addGoodsInCart(Car, number,cart);
        session.setAttribute("cart",cart);
        return new ModelAndView("redirect:/cartPage.do");
    }
    //�Ƴ�
    @RequestMapping("/removeGoodsFromCart")
    public ModelAndView removeGoodsFromCart(Integer bid,HttpSession session){
        Car Car=CarService.findById(bid);
        Cart cart=(Cart) session.getAttribute("cart");
        cart=cartService.removeGoodsFromCart(Car, cart);
        session.setAttribute("cart",cart);
        return new ModelAndView("redirect:/cartPage.do");
    }
   //�����ﳵ
    @RequestMapping("/cleanCart")
    public ModelAndView cleanCart(HttpSession session){
        Cart cart=null;
        session.setAttribute("cart",cart);
        return new ModelAndView("redirect:/cartPage.do");
    }
    //�����
    @ResponseBody
    @RequestMapping(value = "/checkStore",produces={"text/html;charset=UTF-8;","application/json;"})
    public String checkStore(HttpSession session){
        Cart cart =(Cart)session.getAttribute("cart");
        Map<Car, Integer> map=cart.getGoods();
        Iterator<Map.Entry<Car, Integer>> iter = map.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry<Car, Integer> entry =  iter.next();
            Car Car = entry.getKey();
            Integer number = entry.getValue();
            if (!CarService.checkStore(Car.getBid(),number)){
            	 return "��"+Car.getBname()+"����治��,���ʣ��:"+Car.getStore();
            }
        }
        return "success";
    }





}
