package ssm.car.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.car.mapper.CarOrderMapper;
import ssm.car.service.ICarOrderService;

import ssm.car.bean.CarOrder;
import ssm.car.bean.CarOrderExample;
import ssm.car.bean.CarOrderExample.Criteria;

@Service
public class CarOrderService implements ICarOrderService{
	
	@Resource
	private CarOrderMapper CarOrderMapper;

	@Override
	public int addCarOrder(CarOrder CarOrder) {
		// TODO Auto-generated method stub
		return CarOrderMapper.insert(CarOrder);
	}

	@Override
	public int selectOid(CarOrderExample example) {
		// TODO Auto-generated method stub
		List<CarOrder> CarOrders = CarOrderMapper.selectByExample(example);
		CarOrder CarOrder=CarOrders.get(0);
		return CarOrder.getOid();
	}

	@Override
	public List<CarOrder> selectByExample(CarOrderExample example) {
		// TODO Auto-generated method stub
		return CarOrderMapper.selectByExample(example);
	}

	@Override
	public int deleteByPrimaryKey(Integer oid) {
		// TODO Auto-generated method stub
		return CarOrderMapper.deleteByPrimaryKey(oid);
	}

	@Override
	public CarOrder selectByPrimaryKey(Integer oid) {
		// TODO Auto-generated method stub
		return CarOrderMapper.selectByPrimaryKey(oid);
	}

	@Override
	public int update(CarOrder record) {
		// TODO Auto-generated method stub
		System.out.println(record);
		CarOrder CarOrder = CarOrderMapper.selectByPrimaryKey(record.getOid());
		if(record.getOname()!=null&&!record.getOname().equals("")){
			CarOrder.setOname(record.getOname());
		}
		if(record.getAdress()!=null&&!record.getAdress().equals("")){
			CarOrder.setAdress(record.getAdress());
		}
		if(record.getStatus()!=null&&!record.getStatus().equals("")){
			CarOrder.setStatus(record.getStatus());
		}
		CarOrderExample example = new CarOrderExample();
		Criteria cri = example.createCriteria();
		cri.andOidEqualTo(record.getOid());
		return CarOrderMapper.updateByExample(CarOrder, example);
	}

	// ---- TODO: djzhao --- //

    @Override
    public int getOrderNumberByBid(Integer bid) {
        return CarOrderMapper.getOrderNumberByBid(bid);
    }

}
