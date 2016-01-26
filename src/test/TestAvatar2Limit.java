package test;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

import org.junit.Test;

public class TestAvatar2Limit {
	
	AvatarTest test = new AvatarTest();
	
	@Test
	public void testAvatar() throws SQLException{
		
		System.out.println("TestAvatar2Limit run...");
		
		assertEquals(true, test.testGetAvatar(2));
	}
}
