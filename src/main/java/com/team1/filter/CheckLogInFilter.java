package com.team1.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team1.domain.user.UserVO;

/**
 * Servlet Filter implementation class CheckLogInFilter
 */
public class CheckLogInFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CheckLogInFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		if (vo == null) {
			// 없으면 /login 으로 redirect
			String location = req.getContextPath() + "/user/login";
			HttpServletResponse res = (HttpServletResponse) response;
			res.sendRedirect(location);
		} else {
			// 있으면 (로그인된 상태이면)
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
