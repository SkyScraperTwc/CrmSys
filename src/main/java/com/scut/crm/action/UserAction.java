package com.scut.crm.action;

import com.scut.crm.constant.PageReturnConst;
import com.scut.crm.dao.po.User;
import com.scut.crm.entity.Pagination;
import com.scut.crm.service.impl.UserServiceImpl;
import com.scut.crm.utils.ScopeUtils;
import com.scut.crm.web.vo.loginRequest;
import lombok.Data;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

@Data
@Controller
@Scope("prototype")
public class UserAction {

	private Logger logger = Logger.getLogger(UserAction.class);

	private loginRequest loginRequest;

	private User user;

	private String currentPage;

	@Autowired
	private UserServiceImpl userService;

	public String list() throws InvocationTargetException, IllegalAccessException {
		Map<String,Object> map = new HashMap<>();
		map.put("currentPage",currentPage);
		Pagination<User> pagination = userService.listByPage(map);
		ScopeUtils.getRequestMap().put("pagination",pagination);
		/**返回到主页面*/
		return PageReturnConst.USER_INDEX;
	}

	/**
	 * 用户登录
	 */
	public String login() throws Exception {
		logger.info(loginRequest);
		boolean loginFlag = userService.login(loginRequest.getUsername(), loginRequest.getPassword());
		if(loginFlag){
			return PageReturnConst.LOGIN_SUCCESS;
		}else {
			return PageReturnConst.TOLOGIN;
		}
	}

	/**
	 * 登录页面
	 */
	public String toLogin() throws Exception {
		return PageReturnConst.TOLOGIN;
	}

}
