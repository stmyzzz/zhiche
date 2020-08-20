package ssm.car.service;

import java.util.List;

import ssm.car.bean.CarOrder;
import ssm.car.bean.CarOrderExample;


public interface ICarOrderService {
	int addCarOrder(CarOrder CarOrder);
	
	int selectOid(CarOrderExample example);
	
	List<CarOrder> selectByExample(CarOrderExample example);
	
	int deleteByPrimaryKey(Integer oid);
	
	CarOrder selectByPrimaryKey(Integer oid);
	
	int update( CarOrder record);


	// --- TODO: djzhao --- //

    int getOrderNumberByBid(Integer bid);
}
