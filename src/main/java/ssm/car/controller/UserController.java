package ssm.car.controller;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ssm.car.bean.Car;
import ssm.car.bean.CarOrder;
import ssm.car.bean.CarOrderExample;
import ssm.car.bean.CarOrderExample.Criteria;
import ssm.car.bean.OrderDetail;
import ssm.car.bean.OrderDetailExample;
import ssm.car.bean.User;
import ssm.car.service.ICarOrderService;
import ssm.car.service.ICarService;
import ssm.car.service.IOrderDetailService;
import ssm.car.service.IUserService;
import ssm.car.util.MD5Utils;

@Controller
public class UserController {
	
	@Resource
	private IUserService userService;
	@Resource 
	private ICarService CarService;
	@Resource
	private ICarOrderService CarOrderService;
	@Resource
	private IOrderDetailService orderDetailService;

	@RequestMapping("backLoginPage")
	public String loginPage(){
		return "manage/login";
	}

	@RequestMapping(value = "backLogin.do")
	public String login(HttpSession session,String username, String password) {
		if (!StringUtils.isEmpty(username) && !StringUtils.isEmpty(password)) {
			if (username.equals(password) && username.equals("admin")) {
				session.setAttribute("admin","admin"	);
				return "manage/index";
			}
		}
		return "manage/login";
	}
	@ResponseBody
	@RequestMapping("/userReg")
	public String userReg(String userName,String passWord){
		User user=new User();
		user.setUname(userName);
		String md5Pwd = MD5Utils.encode(passWord);
		user.setPassword(md5Pwd);
		if(userService.userReg(user)){
			return "success";
		}
		return "false";
	}

	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(String userName,String passWord,HttpSession session){
	
		User user=new User();
		user.setUname(userName);
		String md5Pwd = MD5Utils.encode(passWord);
		user.setPassword(md5Pwd);
		if(userService.userLogin(user).getUid()!=null){
			User sessionUser=userService.userLogin(user);
			sessionUser.setPassword("");
			session.setAttribute("user",sessionUser);
			return "success";
		}
		return "false";
	}
	@RequestMapping("/manaUser")
	public String manaUser(Integer pageNum,Model model){
		if(pageNum!=null){
			PageHelper.startPage(pageNum,ssm.car.util.Constant.MU_PAGE_SIZE);
		}else{
			PageHelper.startPage(1, ssm.car.util.Constant.MU_PAGE_SIZE);
		}
		List<User> users = userService.findAllUser();
		 PageInfo<User> pageInfo = new PageInfo<User>(users);
		 model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("users", users);
		return "manage/user";
	}
	@RequestMapping("/modifyUserPage")
	public String modifyUserPage(Model model,Integer uid){
		User user = userService.findUserById(uid);
		model.addAttribute("user", user);
		return "manage/user-modify";
	}
	@RequestMapping("/modifyUser")
	public ModelAndView manaUser(Integer uid,String userName,String gender,String email,String phone,String address){
		User user=new User();
		user.setUid(uid);
		user.setUname(userName);
	
		user.setGender(gender);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAdress(address);
		userService.userModify(user);
		return new ModelAndView("redirect:/manaUser.do");
	}
	@RequestMapping("/delUser")
	public ModelAndView deleteUser(Integer uid){
		userService.deleteById(uid);
		return new ModelAndView("redirect:/manaUser.do");
	}
	@RequestMapping("/addUser")
	public ModelAndView addUser(String userName,String passWord,String gender,String email,String phone,String address){
		User user = new User();
		user.setUname(userName);
		user.setPassword(passWord);
		user.setGender(gender);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAdress(address);
		userService.addUser(user);
		return new ModelAndView("redirect:/manaUser.do");
	}
    //更新页面
	@RequestMapping("/updateUserPage")
	public String updateUserPage(Model model,HttpSession session){
		User sessionUser= (User) session.getAttribute("user");
		User user=userService.findUserById(sessionUser.getUid());
		model.addAttribute("user",user);
		return "front/update";
	}
	//发现
	@RequestMapping("/findinfor")
	public String findinfor(Model model,HttpSession session){
		User sessionUser= (User) session.getAttribute("user");
		User user=userService.findUserById(sessionUser.getUid());
		model.addAttribute("user",user);
		return "front/user-infor";
	}
	
	//更新用户信息
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(Integer uid,String uname,String gender,String email,String phone,String address,String ulike,String intro,@RequestParam MultipartFile file, HttpServletRequest request,HttpSession session) throws IOException{
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddmmss");
	        String res = sdf.format(new Date());
	 
	        // uploads文件夹位置 String path =  "E:\\program\\eclipse project\\Server\\WebContent\\img" D:\futurecar\1wqe\src\main\webapp\images\product\2020\8
	        //String rootPath = "D:\\futurecar\\1wqe\\src\\main\\webapp\\images\\product";
	      
	        String rootPath = request.getSession().getServletContext().getRealPath("images/product/");
	        // 原始名称
	        String originalFileName = file.getOriginalFilename();
	        // 新文件名
	        String newFileName = res + originalFileName.substring(originalFileName.lastIndexOf("."));
	        // 创建年月文件夹
	        Calendar date3 = Calendar.getInstance();
	        File dateDirs = new File(date3.get(Calendar.YEAR) + File.separator + (date3.get(Calendar.MONTH)+1));
	 
	        // 新文件
	        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
	        // 判断目标文件所在目录是否存在
	        if( !newFile.getParentFile().exists()) {
	            // 如果目标文件所在的目录不存在，则创建父目录
	            newFile.getParentFile().mkdirs();
	        }
	        System.out.println(newFile);
	        System.out.println(rootPath);
	        // 将内存中的数据写入磁盘
	        file.transferTo(newFile);
	        // 完整的url
	        String image = date3.get(Calendar.YEAR) + "/" + (date3.get(Calendar.MONTH)+1) + "/" + newFileName;
	        System.out.println(image);
		
	


		User user=new User();
	
		user.setUimg(image);
		
		user.setUid(uid);
		user.setUname(uname);
		user.setGender(gender);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAdress(address);
		user.setUlike(ulike);
		user.setIntro(intro);
	
		User sessionUser=userService.userLogin(user);
	
		session.setAttribute("user",sessionUser);
		userService.userModify(user);
		return new ModelAndView("redirect:/findinfor.do");
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session){
		session.removeAttribute("user");
		session.removeAttribute("cart");
		return new ModelAndView("redirect:/index.do");
	}
	@RequestMapping("/userOrder")
	public String userOrder(Model model,Integer uid,Integer pageNum){
		Set<Car> Cars=new HashSet<Car>();
		CarOrderExample example = new CarOrderExample();
		Criteria cri = example.createCriteria();
		cri.andUidEqualTo(uid);
		OrderDetailExample example2 = new OrderDetailExample();
		List<OrderDetail> orderDetails = orderDetailService.selectByExample(example2);
		for(OrderDetail od:orderDetails){
			Car Car = CarService.findById(od.getcarId());
			Cars.add(Car);
		}
		if(pageNum!=null){
			PageHelper.startPage(pageNum,ssm.car.util.Constant.UO_PAGE_SIZE,"date desc");
		}else{
			PageHelper.startPage(1, ssm.car.util.Constant.UO_PAGE_SIZE,"date desc");
		}
		List<CarOrder> CarOrders = CarOrderService.selectByExample(example);
		PageInfo<CarOrder> pageInfo = new PageInfo<CarOrder>(CarOrders);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("CarOrders", CarOrders);
		model.addAttribute("Cars", Cars);
		model.addAttribute("orderDetails", orderDetails);
		return "front/user-order";
	}
	@ResponseBody
	@RequestMapping("/updatePwd")
	public String updatePwd(Integer uid,String password,String newPassword){
		password = MD5Utils.encode(password);
		newPassword = MD5Utils.encode(newPassword);
		boolean flag = userService.updatePwd(uid, password, newPassword);
		if(flag){
			return "success";
		}
		return "false";
	}
}
