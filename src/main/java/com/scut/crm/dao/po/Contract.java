package com.scut.crm.dao.po;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class Contract {
    /**
     * id
     */
    private Integer id;
    /**
     * 合同名字
     */
    private String name;
    /**
     * 合同类型
     */
    private String type;//1买卖合同 2租赁合同 3承揽合同 4技术合同
    /**
     * 合同状态
     */
    private String state;//1执行中 2结束 3意外中止
    /**
     * 合同金额
     */
    private BigDecimal money;
    /**
     * 客户ID
     */
    private String customerId;
    /**
     * 客户名称
     */
    private String customerName;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date editTime;

}
