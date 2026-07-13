package com._520it.crm.mapper;

import com._520it.crm.domain.CustomerVO;
import com._520it.crm.req.CustomerChartQueryObject;
import com._520it.crm.req.PageReq;
import com._520it.crm.resp.vo.CustomerChartVo;

import java.util.List;

public interface CustomerChartMapper {

    List<CustomerChartVo> queryByCondition(CustomerChartQueryObject qo);

    Long queryByConditionCount(CustomerChartQueryObject qo);

    List<String> selectTimeYear(PageReq qo);

    List<Long> selectAmountYear(PageReq qo);

    List<CustomerVO> selectPie(PageReq qo);
}