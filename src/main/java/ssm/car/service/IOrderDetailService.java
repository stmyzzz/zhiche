package ssm.car.service;


import java.util.List;

import ssm.car.bean.OrderDetail;
import ssm.car.bean.OrderDetailExample;


public interface IOrderDetailService {
	int addOrderDetail(OrderDetail orderDetail);
	
	List<OrderDetail> selectByExample(OrderDetailExample example);
	
	OrderDetail selectByPrimaryKey(Integer id);
	
	int updateByPrimaryKey(OrderDetail record);
	
	int deleteByOid(Integer oid);
}
