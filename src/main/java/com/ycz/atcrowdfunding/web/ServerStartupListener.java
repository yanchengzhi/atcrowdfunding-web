package com.ycz.atcrowdfunding.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * ��Ϊһ��������ʹ�ã�ʵ����ServletContextListener�ӿ�
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
		//��webӦ�����Ʊ��浽application��Χ��
		ServletContext application = arg0.getServletContext();//��ȡServletContext����
		String path = application.getContextPath();//��ȡ��·��
		application.setAttribute("APP_PATH", path);//����·���浽appplication������Χ��

	}

}
