/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mramm
 */
public class getairline extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String ar = req.getParameter("ar");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
            // Statement stmt=stmt.getConnection(ResultSet.CONCUR_UPDATABLE,ResultSet.TYPE_SCROLL_SENSITIVE);
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from airlines  where name like '%" + ar + "%' or iata like '%" + ar + "%' limit 0,10");
            int i = 0;
            String label = "";
            while (rs.next()) {
                File f = new File(req.getServletContext().getRealPath("/images/" + rs.getString("name") + ".jpg"));
                File f1 = new File(req.getServletContext().getRealPath("/images/" + rs.getString("name") + ".gif"));
                if (f.exists()) 
                {
                    label += "<span> <img src='images/" + rs.getString("name") + ".jpg' style='height:30px;wisth:30px;'> <label style='cursor:pointer'  onclick=set1(this.innerHTML)>" + rs.getString("iata") + "--" + rs.getString("name") + "</label><br/>";
                } 
                else if (f1.exists()) 
                {
                    label += "<span> <img src='images/" + rs.getString("name") + ".gif' style='height:30px;wisth:30px;'> <label style='cursor:pointer'  onclick=set1(this.innerHTML)>" + rs.getString("iata") + "--" + rs.getString("name") + "</label><br/>";
                } 
                else 
                {
                    String name = rs.getString("iata") + "-" + rs.getString("name");
                    label += "<span onclick=set1('" + name + "')> <img src='images/default.png' style='height:30px;wisth:30px;'> <label style='cursor:pointer'  onclick=set1(this.innerHTML)>" + name + "</label><br/>";

                }
            }
            resp.getWriter().println(label);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
