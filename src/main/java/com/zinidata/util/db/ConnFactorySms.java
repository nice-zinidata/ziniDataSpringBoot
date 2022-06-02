package com.zinidata.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnFactorySms {

    private String DRIVER = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://116.125.141.168:23306/yosi";
    private String USER = "lakecomo";
    private String PASSWORD = "lakecomoqweasd!23";

    public Connection createConnection() throws SQLException{
        Connection con = null;

        try{
            System.out.println(DRIVER);
            System.out.println(URL);
            System.out.println(USER);
            System.out.println(PASSWORD);
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        }catch(Exception e){
            e.printStackTrace();
        }

        return con;
    }
}
