package test;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;

import org.junit.Test;

public class TestAvatarMain {

	AvatarTest test = new AvatarTest();

	@Test
	public void testAvatar() throws SQLException {

		System.out.println("TestAvatarMain run...");

		assertEquals(true, test.testGetAvatar(1));
	}
}
