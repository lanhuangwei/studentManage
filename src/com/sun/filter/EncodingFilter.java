package com.sun.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.dsig.spec.XPathType;
import java.io.IOException;

public class EncodingFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        // 设置编码格式为 UTF-8
        request.setCharacterEncoding("UTF-8");

        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
    }
}
