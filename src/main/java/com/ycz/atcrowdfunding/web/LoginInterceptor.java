package com.ycz.atcrowdfunding.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ycz.atcrowdfunding.pojo.User;

/**
 * ��¼������
 * 
 * @author Administrator
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	/**
	 * �����ͼ��Ⱦ֮��ִ�еķ���
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * �ڿ�����ִ�����֮��ִ�е��߼�����
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * �ڿ�����ִ��֮ǰ���ҵ���߼����� �����ķ���ֵ�����߼��Ƿ�������У�true��ʾ������false��ʾ�ж�
	 */
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// �жϵ�ǰ�û��Ƿ��Ѿ���¼
		HttpSession session = arg0.getSession();// ��ȡsession����
		User loginUser = (User) session.getAttribute("currentUser");// ��session���л�ȡ����
		if (loginUser == null) {// δ��¼���ض��򵽵�¼����
			String path = session.getServletContext().getContextPath();//��ȡ·��
			arg1.sendRedirect(path + "/login");
			return false;
		} else {//��¼�����ִ��
			return true;
		}
	}

}
