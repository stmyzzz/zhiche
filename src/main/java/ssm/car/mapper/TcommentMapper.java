package ssm.car.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import ssm.car.bean.Tcomment;
import ssm.car.bean.TcommentExample;

public interface TcommentMapper {
    long countByExample(TcommentExample example);

    int deleteByExample(TcommentExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Tcomment record);

    int insertSelective(Tcomment record);

    List<Tcomment> selectByExample(TcommentExample example);

    Tcomment selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Tcomment record, @Param("example") TcommentExample example);

    int updateByExample(@Param("record") Tcomment record, @Param("example") TcommentExample example);

    int updateByPrimaryKeySelective(Tcomment record);

    int updateByPrimaryKey(Tcomment record);
}