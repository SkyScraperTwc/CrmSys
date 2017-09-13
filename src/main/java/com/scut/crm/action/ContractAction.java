package com.scut.crm.action;

import com.scut.crm.constant.PageReturnConst;
import com.scut.crm.dao.po.Contract;
import com.scut.crm.dao.po.Customer;
import com.scut.crm.entity.Pagination;
import com.scut.crm.service.impl.ContractServiceImpl;
import com.scut.crm.service.impl.CustomerServiceImpl;
import com.scut.crm.utils.ScopeUtils;
import lombok.Data;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
@Scope("prototype")
@Controller
public class ContractAction {

    private Logger logger = Logger.getLogger(UserAction.class);

    private String customerId;

    private String currentPage;

    @Autowired
    private ContractServiceImpl contractService;

    public String checkContract(){
        List<Contract> contractList = contractService.listByForeignKey(customerId);
        ScopeUtils.getRequestMap().put("contractList", contractList);
        return PageReturnConst.CHECK_SUCCESS;
    }

    public String list(){
        Map<String,Object> map = new HashMap<>();
        map.put("currentPage",currentPage);
        Pagination<Contract> pagination = contractService.listByPage(map);
        ScopeUtils.getRequestMap().put("pagination",pagination);
        /**返回到主页面*/
        return PageReturnConst.CONTRACT_INDEX;
    }
}
