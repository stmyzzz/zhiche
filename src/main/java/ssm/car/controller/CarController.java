package ssm.car.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ssm.car.bean.Car;
import ssm.car.bean.CarExample;
import ssm.car.bean.Cart;
import ssm.car.bean.Comment;
import ssm.car.bean.User;
import ssm.car.bean.CarExample.Criteria;
import ssm.car.service.ICarOrderService;
import ssm.car.service.ICarService;
import ssm.car.service.ICartService;
import ssm.car.service.ICommentService;


@Controller
public class CarController {
	@Resource 
	private ICarService CarService;

	@Resource
	private ICommentService commentService;

	@Resource
	private ICarOrderService CarOrderService;
	
	@RequestMapping("/index")
	public String index(Model model,HttpServletRequest request){
		Set<String> bts=CarService.CarType();
		CarExample example = new CarExample();
		example.setOrderByClause("bid desc");
		List<Car> Cars = CarService.selectByExample(example);
		List<Car> CCars =getCookies(request);
		model.addAttribute("Cars", Cars);
		model.addAttribute("CCars", CCars);
		model.addAttribute("bts", bts);
		return "front/index";
	}
	

	
	@RequestMapping("/allcar")
	public String allCar(Integer pageNum,Model model){
		if(pageNum!=null){
			PageHelper.startPage(pageNum,ssm.car.util.Constant.MB_PAGE_SIZE);
		}else{
			PageHelper.startPage(1, ssm.car.util.Constant.MB_PAGE_SIZE);
		}
		List<Car> Cars = CarService.findAllCar();
		PageInfo<Car> pageInfo = new PageInfo<Car>(Cars);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("Cars", Cars);
		return "front/allcar";
	}
	
	
	@RequestMapping("/addCar")
	public ModelAndView addUser(String bname,String detail,String pirce,String type,String maxspeed,String speedtime,String dateString,Integer store,@RequestParam MultipartFile file, HttpServletRequest request) throws  IOException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddmmss");
	    String res = sdf2.format(new Date());
		   Date date =null;
        // uploads文件夹位置 String path =  "E:\\program\\eclipse project\\Server\\WebContent\\img" D:\futurecar\1wqe\src\main\webapp\images\product\2020\8
        //String rootPath = "D:\\futurecar\\1wqe\\src\\main\\webapp\\images\\product";
      
        String rootPath = request.getSession().getServletContext().getRealPath("images/product/");
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "r" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date2 = Calendar.getInstance();
        File dateDirs = new File(date2.get(Calendar.YEAR) + File.separator + (date2.get(Calendar.MONTH)+1));
 
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
        String image = date2.get(Calendar.YEAR) + "/" + (date2.get(Calendar.MONTH)+1) + "/" + newFileName;
        System.out.println(image);
		
			try {
				date = sdf.parse(dateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		Car Car = new Car();
		Car.setBname(bname);
		Car.setDetail(detail);
		Car.setPirce(pirce);
		Car.setType(type);
		Car.setMaxspeed(maxspeed);
		Car.setSpeedtime(speedtime);
		Car.setDate(date);
		Car.setImage(image);
		Car.setStore(store);
		CarService.addCar(Car);
		return new ModelAndView("redirect:/manaCar.do");
	}

	@RequestMapping("/manaCar")
	public String manaCar(Integer pageNum,Model model){
		if(pageNum!=null){
			PageHelper.startPage(pageNum,ssm.car.util.Constant.MB_PAGE_SIZE);
		}else{
			PageHelper.startPage(1, ssm.car.util.Constant.MB_PAGE_SIZE);
		}
		List<Car> Cars = CarService.findAllCar();
		PageInfo<Car> pageInfo = new PageInfo<Car>(Cars);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("Cars", Cars);
		return "manage/product";
	}
	//删除跑车
	@RequestMapping("/delCar")
	public ModelAndView deleteUser(Integer bid){
		CarService.delById(bid);
		return new ModelAndView("redirect:/manaCar.do");
	}
	
	@RequestMapping("/modifyCarPage")
	public String modifyUserPage(Model model,Integer bid){
		Car Car = CarService.findById(bid);
		Set<String> bts=CarService.CarType();
		model.addAttribute("bts", bts);
		model.addAttribute("Car", Car);
		return "manage/product-modify";
	}
	@RequestMapping("/addproductPage")
	public String addproductPage(Model model){
		Set<String> bts=CarService.CarType();
		model.addAttribute("bts", bts);
		return "manage/product-add";
	}
	//上传跑车信息
	@RequestMapping("/modifyCar")
	public ModelAndView modifyCar(Integer bid,String bname,String detail,String pirce,String maxspeed,String speedtime,String dateString,String type,Integer store,@RequestParam MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException{
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Date date = null;
		 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssSS");
	        String res = sdf2.format(new Date());
	 
	        // uploads文件夹位置 String path =  "E:\\program\\eclipse project\\Server\\WebContent\\img" D:\futurecar\1wqe\src\main\webapp\images\product\2020\8
	        //String rootPath = "D:\\futurecar\\1wqe\\src\\main\\webapp\\images\\product";
	      
	        String rootPath = request.getSession().getServletContext().getRealPath("images/product/");
	        // 原始名称
	        String originalFileName = file.getOriginalFilename();
	        // 新文件名
	        String newFileName = "r" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
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
	    	try {
				date = sdf.parse(dateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		Car car = new Car();
		
			car.setImage(image);
		
		car.setBname(bname);
		car.setDetail(detail);
		car.setPirce(pirce);
		car.setMaxspeed(maxspeed);
		car.setSpeedtime(speedtime);
		car.setBid(bid);
		car.setType(type);
		
		car.setDate(date);
		car.setStore(store);

		
		CarService.modifyCar(car);
		return new ModelAndView("redirect:/manaCar.do");
	}
	//跑车具体信息
	@RequestMapping("/CarView")
	public String CarView(Integer pageNum,Integer bid,Model model,HttpServletRequest request,HttpServletResponse response){
		setCookies(bid, request, response);
		Car Car=CarService.findById(bid);
		String dateStr=new SimpleDateFormat("yyyy-MM-dd").format(Car.getDate());
		Set<String> bts=CarService.CarType();
		List<Car> CCars =getCookies(request);
		if(pageNum!=null){
			PageHelper.startPage(pageNum, ssm.car.util.Constant.C_PAGE_SIZE);
		}else{
			PageHelper.startPage(1,  ssm.car.util.Constant.C_PAGE_SIZE);
		}
		List<Comment> comments = commentService.selectBybid(bid);
		PageInfo<Comment> pageInfo = new PageInfo<Comment>(comments);
		model.addAttribute("CCars", CCars);
		model.addAttribute("bts", bts);
		model.addAttribute("Car", Car);
		model.addAttribute("dateStr", dateStr);
		model.addAttribute("comments", comments);
		model.addAttribute("pageInfo", pageInfo);
		int orderNumber = CarOrderService.getOrderNumberByBid(bid);
		model.addAttribute("soldNum", orderNumber);

		return "front/product-view";
	}
	

	//跑车列表 可以分类出来 可以搜索出来
	@RequestMapping("/productList")
	public String productList(Integer pageNum,Model model,String type,String key,HttpServletRequest request,HttpSession session){
		Set<String> bts=CarService.CarType();
		CarExample example=(CarExample) session.getAttribute("example");
		if(example==null){
			 example = new CarExample();
		}
		if(type!=null){
			example.clear();
			Criteria cri = example.createCriteria();
			cri.andTypeEqualTo(type);
		}
		if(key!=null){
			example.clear();
			Criteria cri = example.createCriteria();
			cri.andBnameLike("%"+key+"%");
		}
		session.setAttribute("example", example);
		if(pageNum!=null){
			PageHelper.startPage(pageNum, ssm.car.util.Constant.PW_PAGE_SIZE);
		}else{
			PageHelper.startPage(1,  ssm.car.util.Constant.PW_PAGE_SIZE);
		}
		List<Car> Cars = CarService.selectByExample(example);
		PageInfo<Car> pageInfo = new PageInfo<Car>(Cars);
		List<Car> CCars =getCookies(request);
		model.addAttribute("CCars", CCars);
		model.addAttribute("bts", bts);
		model.addAttribute("Cars", Cars);
		model.addAttribute("pageInfo", pageInfo);
		return "front/product-list";
	}
	
	
	
	List<Car> getCookies(HttpServletRequest request){
		List<Car> CCars =new ArrayList<Car>();
		String list ="";
        Cookie[] cookies = request.getCookies();
        if(cookies!=null&&cookies.length>0)
        {
            for(Cookie c:cookies)
            {
                if(c.getName().equals("ListViewCookie"))
                {
                   list = c.getValue();
                }
            }
        }
        if(list!=""){
        	String[] arr = list.split(",");
        	for(String s:arr){
        		Car Car = CarService.findById(Integer.parseInt(s));
        		CCars.add(Car);
        	}
        }
		return CCars;
	}
	void setCookies(Integer bid,HttpServletRequest request,HttpServletResponse response){
		boolean flag=true;
		String list ="";
        Cookie[] cookies = request.getCookies();
        if(cookies!=null&&cookies.length>0)
        {
            for(Cookie c:cookies)
            {
                if(c.getName().equals("ListViewCookie"))
                {
                   list = c.getValue();
                }
            }
        }
        String[] arr = list.split(",");
        if(list!=""){
        for(String s:arr){
        	if(Integer.parseInt(s)==bid){
        		flag=false;
        	}
        }
        }
        if(flag){
        	list+=bid+",";
        }
        if(arr!=null&&arr.length>0)
        {
            if(arr.length>=10)
            {
                list="";
            }
        }
        Cookie cookie = new Cookie("ListViewCookie",list);
        response.addCookie(cookie);
	}

	


}
