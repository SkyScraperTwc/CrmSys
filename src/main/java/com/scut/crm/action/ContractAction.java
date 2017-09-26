package com.scut.crm.action;

import com.scut.crm.constant.PageReturnConst;
import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.Pagination;
import com.scut.crm.service.impl.ContractServiceImpl;
import com.scut.crm.service.impl.CustomerServiceImpl;
import com.scut.crm.utils.ScopeUtils;
import com.scut.crm.utils.convert.ContractConvertUtils;
import com.scut.crm.web.vo.save.ContractSaveRequest;
import lombok.Data;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

@Data
@Scope("prototype")
@Controller
@Log4j
public class ContractAction {

    private ContractSaveRequest saveRequest;

    private String customerId;

    private String contractId;

    private String currentPage;

    private String deleteJson;

    @Autowired
    private ContractServiceImpl contractService;

    @Autowired
    private CustomerServiceImpl customerService;

    /**
     * 合同添加
     * @return
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public String add() throws InvocationTargetException, IllegalAccessException {
        log.info("ContractAction----saveRequest"+saveRequest);
        /**获取customer*/
        Customer customer = customerService.getBySerialNumber(saveRequest.getCont_cust_serialNumber());

        /**重点：若同时两个线程进入创建了两个相同的Identifier，则会产生线程安全问题，要加锁确保线程安全*/
        synchronized(this){
            /**获取contract的serialNumber*/
            String contractSerialNumber = contractService.getIdentifier(Contract.class);
            Contract contract = ContractConvertUtils.fromSaveRequest2Contract(saveRequest, contractSerialNumber, customer);
            log.info(contract);
            contractService.save(contract);
        }

        /**要设置customer的商机状态为签订合同	*/
        customer.setOpportunity("签订合同");
        customerService.update(customer);
        return PageReturnConst.ADD_SUCCESS;
    }

    /**
     * 合同详细
     * @return
     */
    public String check(){
        Map<String,Object> map = new HashMap<>();
        map.put("currentPage",currentPage);
        map.put("customerId",customerId);
        Pagination<Contract> pagination = contractService.listByForeignKey(map);
        ScopeUtils.getRequestMap().put("customerId", customerId);
        ScopeUtils.getRequestMap().put("pagination", pagination);
        return PageReturnConst.CHECK_SUCCESS;
    }

    /**
     * 合同列表
     * @return
     */
    public String list(){
        Map<String,Object> map = new HashMap<>();
        map.put("currentPage",currentPage);
        Pagination<Contract> pagination = contractService.listByPage(map);
        ScopeUtils.getRequestMap().put("pagination",pagination);
        return PageReturnConst.CONTRACT_INDEX;
    }

    /**
     * 合同删除
     * @return
     */
    public String delete(){
        contractService.remove(new Contract(Integer.valueOf(contractId)));
        deleteJson = PageReturnConst.DELETE_SUCCESS;
        return deleteJson;
    }
}
