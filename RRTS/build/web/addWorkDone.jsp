<%@page import="RRTS.*"%>
<%@ page import ="java.sql.*" %>
<%
    try{   
        int CEMENT_USED = Integer.parseInt(request.getParameter("cement_used"));
        int SAND_TRIPS_USED= Integer.parseInt(request.getParameter("sand_used"));
        int WATER_USED = Integer.parseInt(request.getParameter("water_used"));
        int LABOURERS_USED = Integer.parseInt(request.getParameter("labourers_used"));
        int ComplaintID = Integer.parseInt(request.getParameter("ComplaintID"));
        
        int PercentDone = Integer.parseInt(request.getParameter("percent"));
        
        int CEMENT_REQUIRED = Integer.parseInt(request.getParameter("cement_required"));
        int SAND_TRIPS_REQUIRED= Integer.parseInt(request.getParameter("sand_required"));
        int WATER_REQUIRED = Integer.parseInt(request.getParameter("water_required"));
        int LABOURERS_REQUIRED = Integer.parseInt(request.getParameter("labourers_required"));
        String Area = request.getParameter("area");
        
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RRTS?" + "user=root&password=temps510"); 
        PreparedStatement pst2 = conn.prepareStatement("SELECT * FROM WORK where ComplaintID="+ComplaintID+";");
        ResultSet rs = pst2.executeQuery(); 
        if(rs.next()){
            PreparedStatement pst = conn.prepareStatement("UPDATE WORK SET CEMENT_USED ="+CEMENT_USED+",SAND_TRIPS_USED="+SAND_TRIPS_USED+",WATER_USED="+WATER_USED+",LABOURERS_USED="+LABOURERS_USED+",PercentDone="+PercentDone+",CEMENT_REQUIRED="+CEMENT_REQUIRED+",SAND_TRIPS_REQUIRED="+SAND_TRIPS_REQUIRED+",WATER_REQUIRED="+WATER_REQUIRED+",LABOURERS_REQUIRED="+LABOURERS_REQUIRED+" WHERE ComplaintID = " +ComplaintID+";");
            pst.executeUpdate();
        }
        else{
            PreparedStatement pst = conn.prepareStatement("insert into WORK values ("+ComplaintID+","+CEMENT_USED+","+SAND_TRIPS_USED+","+WATER_USED+","+LABOURERS_USED+","+PercentDone+","+CEMENT_REQUIRED+","+SAND_TRIPS_REQUIRED+","+WATER_REQUIRED+","+LABOURERS_REQUIRED+",\'"+Area+"\');");
            pst.executeUpdate();
        }
          
        out.println("Work Done Updated");
        %><li><a href="conductor.jsp">Home</a></li><%
        
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again"+e);       
   }      
%>
