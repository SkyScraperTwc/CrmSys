package com.scut.crm.utils.convert;

import com.scut.crm.constant.PropertyMapConst;
import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.utils.convert.base.SuperConvertUtils;
import com.scut.crm.web.vo.save.ContractSaveRequest;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * Entity转换工具类
 */

public final class ContractConvertUtils extends SuperConvertUtils{

    public static Contract fromSaveRequest2Contract(ContractSaveRequest saveRequest, String serialNumber, Customer customer) throws InvocationTargetException, IllegalAccessException {
        Contract contract = new Contract();
        BeanUtils.setProperty(contract,"id",null);
        BeanUtils.setProperty(contract,"serialNumber",serialNumber);
        BeanUtils.setProperty(contract,"name",saveRequest.getCont_name());
        BeanUtils.setProperty(contract,"type", getValue(getUnmodifiableMap(PropertyMapConst.CONTRACT_TYPE_MAP),saveRequest.getCont_type()));
        BeanUtils.setProperty(contract,"state",getValue(getUnmodifiableMap(PropertyMapConst.CONTRACT_STATE_MAP),saveRequest.getCont_state()));
        BeanUtils.setProperty(contract,"money",saveRequest.getCont_money());
        BeanUtils.setProperty(contract,"customer",customer);
        BeanUtils.setProperty(contract,"createTime",new Date());
        BeanUtils.setProperty(contract,"editTime",new Date());
        return contract;
    }
}
