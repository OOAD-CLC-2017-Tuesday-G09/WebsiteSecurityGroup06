package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBConnect {
	static Connection con;
    public static Connection getConnection()
    {
        try
        {            
          
                Class.forName("com.mysql.jdbc.Driver");                    
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/websitesecurity?user=root&password=0123");          
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }        
        return con;
    }
    
    public static void CloseConnection()
    {
        if(con!=null)
        {
            try
            {
                con.close();
                con = null;
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }            
        }
        
    }
    
    public static ResultSet getResultFromSqlQuery(String SqlQueryString)
    {
        System.out.println("in funcation");
        ResultSet rs=null;
        if(con==null)
        {
        	getConnection();
        }
        try
        {
            rs = con.createStatement().executeQuery(SqlQueryString);
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }             
        return rs;
    }
            
    
    public static void main(String args[])
    {
        getResultFromSqlQuery("SELECT * FROM product, category WHERE ten_san_pham='Áo khoát Adachi mới'");
        CloseConnection();
        System.out.println("con done" + (con==null));                
    }
}
