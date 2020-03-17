package com.ycz.atcrowdfunding.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 作为一个监听器使用，实现了ServletContextListener接口
 * @author Administrator
 *
 */
public class ServerStartupListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		//将web应用名称保存到application范围中
		ServletContext application = arg0.getServletContext();//获取ServletContext对象
		String path = application.getContextPath();//获取根路径
		application.setAttribute("APP_PATH", path);//将根路径存到appplication总用域范围中

	}

}
