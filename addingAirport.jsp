<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    try {

        File f =
                new File(request.getServletContext().getRealPath("")+"/airport.txt");
        
     
        System.out.println(f.exists()+""+f.getAbsolutePath()+":" );
        System.out.println("ok");
        FileReader fr = new FileReader(f);
        ArrayList<String> arr = new ArrayList<>();
        JSONParser jp = new JSONParser();
        JSONObject object = (JSONObject) jp.parse(fr);
        JSONArray ja = (JSONArray) object.get("airports");
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Driver Loaded");
        Connection conn1 = DriverManager.getConnection("jdbc:mySql://127.0.0.1:3306/irctc", "root", "system");
        System.out.println("Connection created");
        Statement stmt = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        System.out.println("Statement Created");
        for (int i = 0; i < ja.size(); i++) {
            JSONObject inner = (JSONObject) ja.get(i);
         try
         {
            String name = inner.get("name").toString();
                    name=name.replace("'","");
            String cityName = inner.get("city").toString();
            String cityCode = inner.get("iata").toString();
            String cname = inner.get("countryName").toString();
            String longi = inner.get("longitude").toString();
            String lati = inner.get("latitude").toString();
            arr.add(name + "," + cityName + "," + cityCode+","+cname+","+longi+","+lati);
//                    System.out.println(arr);

         }catch(Exception ex)
         {
             
         }
         }
        System.out.println(arr.size());
        for (int j = 0; j < arr.size(); j++) {
           String s1 =   arr.get(j).replace("'", "");
            String s[] = s1.split(",");
            String name1 = s[0];
            String cityName1 = s[1];
            String cityCode1 = s[2];
            String country = s[3];
            String longi = s[4];
            String lati = s[5];
            System.out.println(name1);
            System.out.println(cityName1);
            System.out.println(cityCode1);
            ResultSet rs = stmt.executeQuery("select * from addairport where airportCode='" + cityCode1 + "' and (cityName ='" + cityName1 + "' and airportName='" + name1 + "')");
//                    System.out.println("Result Set Created");
            if (!(rs.next())) {
//                        String name1 = s.substring(0, s.indexOf(" "));
//                        String cityName1 = s.substring(s.indexOf(" ") + 1, s.indexOf("-"));
//                        String cityCode1 = s.substring(s.indexOf("-"), s.length());
                rs.moveToInsertRow();
                rs.updateString("airportName", name1);
                rs.updateString("cityName", cityName1);
                rs.updateString("airportCode", cityCode1);
                rs.updateString("country", country);
                rs.updateString("longitude", lati);
                rs.updateString("latitude", longi);
                rs.insertRow();
            }
            rs.close();
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
