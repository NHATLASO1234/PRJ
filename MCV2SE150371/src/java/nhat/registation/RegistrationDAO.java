/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhat.registation;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import nhat.utils.DBHelpers;



/**
 *
 * @author ACER
 */
public class RegistrationDAO implements Serializable{

    public boolean checkLogin(String username, String password) 
    throws SQLException, ClassNotFoundException{
        
        Connection con= null;
        PreparedStatement stm= null;
        ResultSet rs =null;
        
        try{
        //1.Connect DB
        con=DBHelpers.makeConnection();
        if(con!=null){
            //2.Create SQLString
            String sql=" Select username"
                    + "From Registration"
                    + "Where username = ? And passwprd = ?";
            //3. Create Statement and assign Parameter value if any
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            //4. Execute query
            rs= stm.executeQuery(sql);
            if(rs.next()){
                 return true;
            }// end if rs is exist
            
        }// end if con is restarted
        }finally{
            if(con!=null){
                con.close();
            }
            if(stm!=null){
                con.close();
            }
            if(rs!=null){
                con.close();
            }
        }
        return false;
    }
    
    
}
