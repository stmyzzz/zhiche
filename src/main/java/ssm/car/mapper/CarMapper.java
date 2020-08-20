package ssm.car.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import ssm.car.bean.Car;
import ssm.car.bean.CarExample;

public interface CarMapper {
    int countByExample(CarExample example);

    int deleteByExample(CarExample example);

    int deleteByPrimaryKey(Integer bid);

    int insert(Car record);

    int insertSelective(Car record);

    List<Car> selectByExample(CarExample example);

    Car selectByPrimaryKey(Integer bid);

    int updateByExampleSelective(@Param("record") Car record, @Param("example") CarExample example);

    int updateByExample(@Param("record") Car record, @Param("example") CarExample example);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

    // ---TODO: djzhao--- //
    List<Car> getAllCars();

    void addCarType(String typename);
}