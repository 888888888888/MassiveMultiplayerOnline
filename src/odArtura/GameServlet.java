package odArtura;

import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class illustrates the usage of Servlet 3.0 asynchronization APIs.
 * It is ported from Grizzly Comet sample and use Servlet 3.0 API here.
 *
 * @author Shing Wai Chan
 * @author JeanFrancois Arcand
 */
@WebServlet(name = "gameServlet", urlPatterns = {"/massive/hades/do/game"}, asyncSupported = true)//path to servlet 

public class GameServlet extends HttpServlet {
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		
		// tutaj trzeba napisac watek informujacy wszystkich uzytkownikow ze cos sie zmnielo 
	}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	
    	
    	//dla nowego polaczenia tworzony jest nowy watek
    	ExecutorService exe = Executors.newFixedThreadPool(10);
    	
    	int x = Integer.valueOf(req.getParameter("x"));
    	int y = Integer.valueOf(req.getParameter("y"));
		
		exe.execute( new FutureTask<String>(new ObslugaKlienta(x, y)){
			public void done(){
				
				try {
					
					System.out.println("Gracz o sie rozlaczyl! ->"+get());
					
				} catch (InterruptedException | ExecutionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});	
		
		res.sendRedirect("http://localhost:8080/MassiveMultiplaerOnline/massive/hades/do/Game.jsp?id=8&flaga=true");
    }
}
