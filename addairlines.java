/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author mramm
 */
@WebServlet(urlPatterns = {"/addairlines"})
public class addairlines extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            HttpURLConnection connn = (HttpURLConnection) new URL("https://api.flightstats.com/flex/airlines/rest/v1/json/active?appId=bebcd06a&appKey=d072f8787f7941354f0f6b3a99bf757f").openConnection();
            connn.connect();
            DataInputStream dis = new DataInputStream(connn.getInputStream());
            String buffer = "";
            while (true) {
                String s = dis.readLine();
                if (s == null) {
                    break;
                }
                buffer += s;
            }
            JSONParser jSONParser = new JSONParser();
            JSONObject jSONObject = (JSONObject) jSONParser.parse(buffer);
            JSONArray jsonarray = (JSONArray) jSONObject.get("airlines");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/irctc", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            for (int i = 0; i < jsonarray.size(); i++) {
                try {
                    JSONObject jobject = (JSONObject) jsonarray.get(i);
                    String fs = jobject.get("fs").toString();
                    String iata = jobject.get("iata").toString();
                    String icao = jobject.get("icao").toString();
                    String name = jobject.get("name").toString();
                    ResultSet rs = stmt.executeQuery("select * from airlines where iata = '" + iata + "'");
                    if (rs.next() == false) {
                        rs.moveToInsertRow();
                        rs.updateString("fs", fs);
                        rs.updateString("iata", iata);
                        rs.updateString("icao", icao);
                        rs.updateString("name", name);
                        rs.insertRow();
                    }
                    rs.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

        } catch (Exception EX) {
            EX.printStackTrace(resp.getWriter());
        }
    }

}
