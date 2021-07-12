/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhat.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author ACER
 */
public class DBHelpers implements Serializable{
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
      //1.Local Driver - add driver into project 
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    //2.Create connection string
    String url= "jdbc:sqlserver://localhost:1433;databaseName=SE150371";
    //3.Open connection
    Connection con=DriverManager.getConnection(url, "username","password");
    return con;
}
}
