package commons;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetTimeServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doGet (HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException 
	{
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		PrintWriter out = response.getWriter();
		Date currentTime= new Date();
		String message = String.format("Currently time is %tr on %tD.",currentTime, currentTime);
		out.print(message);
	}
}