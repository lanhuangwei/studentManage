package com.sun.servlet;

import com.sun.Utils.Page;
import com.sun.bean.Student;
import com.sun.dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListServlet", urlPatterns = "/ListServlet")
public class ListServlet extends HttpServlet {
    private StudentDao studentDao = new StudentDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取分页参数
        int start = 0;
        int count = 5;

        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Page page = new Page(start, count);

        List<Student> students = studentDao.list(page.getStart(), page.getCount());
        int total = studentDao.getTotal();
        page.setTotal(total);

        request.setAttribute("students", students);
        request.setAttribute("page", page);

        request.getRequestDispatcher("/listStudents.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
