<%@page import="RRTS.*"%>
<%@ page import ="java.sql.*" %>
<%
    try{
        int PRIORITY_ORDER = Integer.parseInt(request.getParameter("pq"));   
        int CEMENT = Integer.parseInt(request.getParameter("cement"));
        int SAND_TRIPS= Integer.parseInt(request.getParameter("sand"));
        int WATER = Integer.parseInt(request.getParameter("water"));
        int LABOURERS = Integer.parseInt(request.getParameter("labourers"));
        int ComplaintID = Integer.parseInt(request.getParameter("ComplaintID"));
        String Area = request.getParameter("area");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RRTS?" + "user=root&password=temps510");    
        PreparedStatement pst = conn.prepareStatement("insert into PRIORITY values ("+PRIORITY_ORDER+","+CEMENT+","+SAND_TRIPS+","+WATER+","+LABOURERS+","+ComplaintID+",\'"+Area+"\');");
        pst.executeUpdate();  
        out.println("Priority Data Updated");
        %><li><a href="supervisor.jsp">Home</a></li><%
        
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>

