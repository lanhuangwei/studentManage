package com.sun.dao;

import com.sun.Utils.DBUtil;
import com.sun.bean.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    public int getTotal() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM student";
        try (Connection c = DBUtil.getConnection(); Statement st = c.createStatement()) {

            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public List<Student> list() {
        return list(0, Short.MAX_VALUE);
    }

    public List<Student> list(int start, int count) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM student ORDER BY studentID  limit ?,?";
        try (Connection c = DBUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, start);
            ps.setInt(2, count);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                int id = rs.getInt("id");
                int studentID = rs.getInt("studentID");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                Date birthday = rs.getDate("birthday");
                student.setId(id);
                student.setStudentID(studentID);
                student.setName(name);
                student.setAge(age);
                student.setSex(sex);
                student.setBirthday(birthday);

                students.add(student);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
