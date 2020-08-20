package ssm.car.util;



import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author dogjay
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // ��������������Ҫ�õ�request,response,session����
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();
        // ����û������URI
        String path = servletRequest.getRequestURI();
        // ��session��ȡԱ��Ϣ
        String admin = (String) session.getAttribute("admin");
        //������Constants.java������д����������˵�ҳ��
        for (int i = 0; i < Constant.NoFilter_Pages.length; i++) {
            if (path.indexOf(Constant.NoFilter_Pages[i]) > -1) {
                chain.doFilter(servletRequest, servletResponse);
                return;
            }
        }
        // ��½ҳ���������
        if (path.indexOf("/backLoginPage.do") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }
        if (path.indexOf("/backLogin.do.do") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        // �ж����û��ȡ��Ա����Ϣ,����ת����½ҳ��
        if (admin == null || "".equals(admin)) {
            // ��ת����½ҳ��
            servletResponse.sendRedirect("/1wqe/login.do");
        } else {
            // �Ѿ���½,�����˴�����
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
        // TODO Auto-generated method stub
    }
}
