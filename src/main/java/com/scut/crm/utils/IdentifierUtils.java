package com.scut.crm.utils;

import com.scut.crm.constant.SerialNumberConst;
import com.scut.crm.entity.Contract;
import com.scut.crm.entity.Customer;
import com.scut.crm.entity.User;

import java.util.Random;

public class IdentifierUtils {

    public static String getSerialNumber(Class c) {
        String base = "123456789";
        String prefix = getPrefix(c);
        Random random = new Random();
        StringBuffer sb = new StringBuffer(prefix);
        for (int i = 0; i < 8; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public static String getPrefix(Class c){
        String prefix = "";
        if (c.equals(User.class)){
            prefix = SerialNumberConst.USER_SERIAL_PREFIX;
        }else if (c.equals(Customer.class)){
            prefix = SerialNumberConst.CUSTOMER_SERIAL_PREFIX;
        }else if (c.equals(Contract.class)){
            prefix = SerialNumberConst.CONTRACT_SERIAL_PREFIX;
        }
        return prefix;
    }
}
