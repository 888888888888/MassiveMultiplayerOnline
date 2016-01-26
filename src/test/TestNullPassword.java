package test;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

public class TestNullPassword {
	
	String login = "testCase";
	String password = "";
	
	LoginTest test = new LoginTest();
	
	@Test
	public void testNullPassword() throws SQLException{

		System.out.println("TestNullPassword run...");
		try {
			
			test.putDataToDataBase("testCase", "testCase");
			test.putDataFromUser(login, password);
			assertEquals(true,test.cheakData(login, password));
		}finally{
			
			test.removeFromDataBase("testCase");
		}			
	}

}
