package com.solutiondesign.skills.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
/**
 * This is just a test DAO that verifies that the database connection can be retrieved via JNDI Lookup and
 * that the database is set up - ie the SKillgroup table exists.
 * @author Dan Borgos
 *
 */
public class TestDAO {
	
	public String doTest() {
        System.out.println("### Attempting JNDI Lookup for Database connection");
        String d = "UNKNOWN";
        Connection connection = getConnection();
        System.out.println("### Attempting JDBC SQL query from JNDI Database connection");
	    if (connection != null) {
	        try {
		        //
		        // A query to get current date time from Oracle database
		        //
		        String sql = "SELECT SkillGroupID, SkillGroupName FROM skillgroup";
		        PreparedStatement statement = connection.prepareStatement(sql);
		        ResultSet rs = statement.executeQuery();
		        System.out.println("### SQL query complete");
		        while (rs.next()) { 
		            String skillGroupID = rs.getString(1);
		            String skillGroupName = rs.getString(2);
		            d = "Found Skillgroup " + skillGroupID + " : " + skillGroupName;
		            System.out.println(d);
		        }
	        } catch (SQLException e) {
	        	e.printStackTrace();
	            System.out.println(e + " : " + e.getMessage());
	            System.out.println(e.getStackTrace());
	            return e.getMessage();
	        } finally {
		        try {
		            if (!connection.isClosed()) {
		            connection.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		            return e.getMessage();
		        }
	        }
	    }
        return d;
	}
	
	/**
	     * Get a database connection from the registered data source in the servlet
	     * container. To registered the JNDI data source you should refer to your
	     * servlet container documentation.
	     * 
	     * @return a database connection
	     */
    private Connection getConnection() {
    Connection connection = null;
    try {
        Context context = new InitialContext();
        Context envCtx = (Context) context.lookup("java:comp/env");
        DataSource dataSource = (DataSource) envCtx.lookup("jdbc/sdg");
        connection = dataSource.getConnection();
    } catch (NamingException e) {
        e.printStackTrace();
        System.out.println(e + " : " + e.getMessage());
        System.out.println(e.getStackTrace());
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println(e + " : " + e.getMessage());
        System.out.println(e.getStackTrace());
    }
    return connection;
    }
}
