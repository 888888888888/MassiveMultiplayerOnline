package test;

import org.junit.Test;
import static org.junit.Assert.assertEquals;
import java.sql.SQLException;

public class TestNullLogin {
	
	String login = "";
	String password = "testCase";
	
	LoginTest test = new LoginTest();
	
	@Test
	public void testNullLogin() throws SQLException{
		
		System.out.println("TestNullLogin run...");
		
		try{
			test.putDataToDataBase("testCase", "testCase");
			test.putDataFromUser(login, password);
		assertEquals(true,test.cheakData(login, password));
		} finally{
			
			test.removeFromDataBase("testCase");
		}
		
	}

}
