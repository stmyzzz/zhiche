package ssm.car.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.car.mapper.CarMapper;
import ssm.car.service.ICarService;

import ssm.car.bean.Car;
import ssm.car.bean.CarExample;
import ssm.car.bean.CarExample.Criteria;

@Service
public class CarService implements ICarService{

	@Resource
	private CarMapper CarMapper;
	
	@Override
	public int addCar(Car Car) {
		return CarMapper.insert(Car);
	}

	@Override
	public List<Car> findAllCar() {
		CarExample example=new CarExample();
		example.setOrderByClause("bid desc");
		List<Car> Cars=CarMapper.selectByExample(example);
//		List<Car> Cars=CarMapper.getAllCars();
		return Cars;
	}

	@Override
	public int delById(Integer bid) {
		// TODO Auto-generated method stub
		return CarMapper.deleteByPrimaryKey(bid);
	}

	@Override
	public Car findById(Integer bid) {
		// TODO Auto-generated method stub
		return CarMapper.selectByPrimaryKey(bid);
	}

	@Override
	public int modifyCar(Car Car) {
		// TODO Auto-generated method stub
		CarExample example=new CarExample();
		Criteria cri = example.createCriteria();
		cri.andBidEqualTo(Car.getBid());
		return CarMapper.updateByExampleSelective(Car, example);
	}

	@Override
	public Set<String> CarType() {
		// TODO Auto-generated method stub
		Set<String> bts=new HashSet<String>();
		CarExample example=new CarExample();
		List<Car> Cars=CarMapper.selectByExample(example);
//		List<Car> Cars = CarMapper.getAllCars();
		for(Car Car:Cars){
			bts.add(Car.getType());
		}
		return bts;
	}

	@Override
	public List<Car> selectByExample(CarExample example) {
		// TODO Auto-generated method stub
		return CarMapper.selectByExample(example);
//		return CarMapper.getAllCars();
	}

	@Override
	public boolean checkStore(Integer bid, Integer number){
		int store=CarMapper.selectByPrimaryKey(bid).getStore();
		if (store-number>=0){
			return true;
		}
		return false;
	}

	@Override
	public int reduceStore(Integer bid, Integer number) {
		// TODO Auto-generated method stub
		Car Car = CarMapper.selectByPrimaryKey(bid);
		Car.setStore(Car.getStore()-number);
		return CarMapper.updateByPrimaryKey(Car);
	}

	// ---TODO: djzhao--- //

	@Override
	public List<Car> getAllCars() {
		return CarMapper.getAllCars();
	}

	@Override
	public void addCarType(String typename) {
		CarMapper.addCarType(typename);
	}
}
