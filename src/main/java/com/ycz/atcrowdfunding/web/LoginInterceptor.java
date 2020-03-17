package com.ycz.atcrowdfunding.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ycz.atcrowdfunding.pojo.User;

/**
 * 登录拦截器
 * 
 * @author Administrator
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	/**
	 * 完成视图渲染之后执行的方法
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * 在控制器执行完毕之后执行的逻辑操作
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * 在控制器执行之前完成业务逻辑操作 方法的返回值决定逻辑是否继续进行，true表示继续，false表示中断
	 */
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// 判断当前用户是否已经登录
		HttpSession session = arg0.getSession();// 获取session对象
		User loginUser = (User) session.getAttribute("currentUser");// 从session域中获取对象
		if (loginUser == null) {// 未登录则重定向到登录界面
			String path = session.getServletContext().getContextPath();//获取路径
			arg1.sendRedirect(path + "/login");
			return false;
		} else {//登录则继续执行
			return true;
		}
	}

}
