<%@page import="RRTS.*"%>
<%@ page import ="java.sql.*" %>
<%
    try{
        String Username = request.getParameter("uname");   
        String Password = request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/RRTS?" + "user=root&password=temps510");    
        PreparedStatement pst = conn.prepareStatement("Select Username,Password,ComplaintID from CONDUCTOR where Username=? and Password=?;");
        pst.setString(1, Username);
        pst.setString(2, Password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) {          
           out.println("Valid login credentials"); 
           Conductor.ComplaintID = rs.getInt("ComplaintID");
           Conductor.uname = Username;%>
            <jsp:forward page = "conductor.jsp"/>
        <%
        }
        else {
           out.println("Invalid login credentials");
           %>Authentication failure.
            <jsp:include page = "index.html"/>
            <%
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again"+e);       
   }      
%>
