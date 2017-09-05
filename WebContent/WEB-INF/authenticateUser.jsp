<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*" errorPage="error.jsp" %>
    
    <%!
      Connection con;
    
    private boolean isValidUser(String userName, String password){
    	try{
    		String sql = "select * from users values where username=? and passwd=?";
    		PreparedStatement ps =con.prepareStatement(sql);
    		ps.setString(1, userName);
    		ps.setString(2, password);
    		ResultSet rs=ps.executeQuery();
    		if(rs.next()){
    			return true;
    		}
    	}
    	catch(Exception ex){
    		ex.printStackTrace();
    	}
    	return false;
    }
    
    %>
    <%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    
   // Getting db information
    
    String driverClass = application.getInitParameter("dbDriver");
    String url = application.getInitParameter("dbUrl");
    String dbUserName = application.getInitParameter("userName");
    String dbPassword = application.getInitParameter("dbPwd");
    
    try{
    	
    	Class.forName(driverClass);
    }
    catch(Exception ex){
    	ex.printStackTrace();
    }
    
    // getting connection with sql driver
    con = DriverManager.getConnection(url, dbUserName, dbPassword);
    
    application.setAttribute("connection", con);
    
    boolean authFlag = isValidUser(userName, password);
    		
    if(authFlag){
    	session.setAttribute("user", userName);
    	response.sendRedirect("courses.jsp");
    }
    else{
    	response.sendRedirect("error.jsp");
    }
    
    %>
