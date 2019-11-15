<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    Cookie[] cks=request.getCookies();
    out.println("cookie object");
    if(cks!=null)
    {
    	for(int i=0;i<cks.length;i++)
    	{
    		String name=cks[i].getName();
    		String value=cks[i].getValue();
    		if(name.equals("auth"))
    		{
    			out.println("matched");
    			break;
    		}
    		if(i==cks.length-1)
    		{
    			out.println("expired");
				response.sendRedirect("./sessionExpired.html");
				return;
    		}
    		i++;
    	}
    }
        else
    	{
         response.sendRedirect("./sessionExpired.html");
         return;
    	}	
    
    %>
    
    <h3>You had successfully logged in.</h3><br>
    	your session is set to expire in 1min<br>
    	try reloading after 10 min <br>
    	<form action="Logout" method="post">
    		<input type="submit" value="Logout">
    		</form>