package test;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

import org.junit.Test;

public class TestLoginMain {
	
	String login = "testCase";
	String password = "testCase";
	
	LoginTest test = new LoginTest();
	
	@Test
	public void testLogin() throws SQLException{
		
		System.out.println("TestLogin run...");
		try {
			
			test.putDataToDataBase("testCase", "testCase");
			test.putDataFromUser(login, password);
			assertEquals(true, test.cheakData(login, password));
		} finally{
			
			test.removeFromDataBase("testCase");
		}	
	}
}
