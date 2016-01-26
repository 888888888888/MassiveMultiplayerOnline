package test;

import java.sql.SQLException;
import dataBase.ClientDb;
import junit.framework.TestCase;
import model.DataSource;
import model.User;

public class LoginTest extends TestCase {
	
	DataSource dataSoure;
	User user;
	ClientDb db = new ClientDb();
	
	protected void putDataToDataBase(String login, String password) throws SQLException{
		
		db.toDB(login, password);
	}
	
	protected void putDataFromUser(String login, String password){
		
		user = new User();
		user.setLogin(login);
		user.setPassword(password);
	}
	
	protected boolean cheakData(String login, String password) throws SQLException{
		
		dataSoure = db.fromDB(user.getLogin());
		
		boolean wynik = dataSoure.checkUser(user.getPassword());
		db.closeDataBase();
		
		return wynik;
				
	}
	
	protected void removeFromDataBase(String login){
		
		db.deleteFromDB(login);
	}
}
