package test;

import java.io.IOException;
import java.sql.SQLException;

import dataBase.ClientDb;
import junit.framework.TestCase;

public class AvatarTest extends TestCase {
	
	ClientDb db = new ClientDb();
	
	protected boolean testGetAvatar(int upLimit) throws SQLException {
		
		for (int id = 1; id <= upLimit; id++){
			
			try{
				
				db.getAvatarById(id);
			} catch (IOException e){
				
				return false;
			} catch (SQLException e) {
				
				return false;
			} finally {
				
				db.closeDataBase();
			}
		};
		
		return true;
	}
	
}
