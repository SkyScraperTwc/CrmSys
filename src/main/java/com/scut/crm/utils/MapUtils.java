package com.scut.crm.utils;

import java.util.Map;
import java.util.Set;

/**
 * Map操作工具类
 */
public final class MapUtils {

    public static String getKeyByValue(Map<String,Object> map, String value){
        Set<String> kSet = map.keySet();
        for (String key : kSet) {
            if(value.equals(map.get(key))){
                return key;
            }
        }
        return null;
    }

    public static Object getValue(Map<String,Object> map, String key){
        return map.get(key);
    }
}
