package dataBase;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DataSource;

/**
 * Klasa do obslugi polaczenia z baza danych (MySql) *
 */
public class ClientDb {
	Connection conn = null;
	javax.sql.DataSource db;
	
	/**
	 * Konstruktor tworzacy polaczenie z baz¹ danych
	 */
	public ClientDb() {
	
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/massive", "root", "");	
		}
		catch(Exception e) {
			System.out.println("Blad bazy danych");
			e.printStackTrace();
		}
	}
	
	/**
	 * Metoda do zamykania bazy danych
	 * @throws SQLException  
	 */
	public void closeDataBase() throws SQLException{
		if(conn != null){
			conn.close();
		}
	}
		
	/**
	 * Funkcja do odczytywania informacji z bazy danych
	 * @param Login klucz naszej bazy danych, musi byæ unikalny
	 * @return obiekt bedacy pobranym uzytkownikiem z bazy, na podstawie podanego loginu
	 * @throws SQLException
	 */
	public DataSource fromDB(String Login) throws SQLException{

		DataSource result = new DataSource();
		try {
		
			java.sql.PreparedStatement statement = conn.prepareStatement("SELECT * FROM Users WHERE LOGIN = ?");
			statement.setString(1, Login);
			java.sql.ResultSet resultset = null;
			resultset = statement.executeQuery();
			if(resultset.next()){
				result.setLogin(resultset.getString("Login"));
				result.setPassword(resultset.getString("Password"));
				
				statement.close();
				return result;
			}
			else{
				// jesli uzytkownik nie istnieje zwaracany jest obiekt o wartosciach nul,
				// powniej jest on wylapywany aby program dzialal poprawnie nawet jesli uzytkownik wpisze zle dane
				result.setLogin("nul");
				result.setPassword("nul");
				return result;
			}
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} 
	}

	/**
	 * Metoda dodajaca uzytkownika do bazy danych
	 * @param login
	 * @param password
	 * @param Sharekey
	 * @return true, false w zaleznosci czy uzytkownik zostal dodany
	 * @throws SQLException
	 */
	public boolean toDB(String login,String password) throws SQLException{
		PreparedStatement prepStmt;
		try {
			prepStmt = conn.prepareStatement("INSERT INTO Users (Login, Password, LoginStatus, privilege) VALUES(?,?,0,'user')");
			prepStmt.setString(1,login);
			prepStmt.setString(2,password);
			prepStmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} 
		return true; 
	}
	
	public void getAvatarById(int id) throws IOException {
		System.out.println(id);
		File newFile;
		FileOutputStream out;
		InputStream input;
		byte[] buffer = new byte[2024];
		
		try {
			java.sql.PreparedStatement statement = conn.prepareStatement("SELECT src FROM avatar WHERE Avatar_ID = (SELECT Avatar_ID FROM champ WHERE champ_id = ?);");
			statement.setInt(1,id);
			statement.execute();
			
			java.sql.ResultSet resultset = null;
			resultset = statement.executeQuery();
			
			while(resultset.next()){
				
				input = resultset.getBinaryStream("src");
				
				newFile = new File("AvatarCurrent.png");
				out = new FileOutputStream(newFile);
				
				while (input.read(buffer) > 0){
					
					out.write(buffer);
				}
			}
			
			System.out.println("przeszlo!");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//pobieranie avatorow z bazy danych
	public void getAvatars() throws IOException{
		
		int counter = 1;
		File newFile;
		FileOutputStream out;
		InputStream input;
		byte[] buffer = new byte[2024];
		
		try {
			java.sql.PreparedStatement statement = conn.prepareStatement("SELECT * FROM Avatar;");
			statement.execute();
			
			java.sql.ResultSet resultset = null;
			resultset = statement.executeQuery();
			
			while(resultset.next()){
				
				input = resultset.getBinaryStream("src");
				
				newFile = new File("Avatar"+String.valueOf(counter)+".png");
				out = new FileOutputStream(newFile);
				
				while (input.read(buffer) > 0){
					
					out.write(buffer);
				}
				counter++;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Integer getIdUser(String Login){
		
		PreparedStatement prepStmt;
		Integer result = -1;
		
		try {
			
			java.sql.PreparedStatement statement = conn.prepareStatement("SELECT User_ID FROM users WHERE login = ?");
			statement.setString(1, Login);
			java.sql.ResultSet resultset = null;
			resultset = statement.executeQuery();
			if(resultset.next()){
				
				result = resultset.getInt("IdUser");
				statement.close();
				return result;
			}
		}catch(SQLException e){
			
		}
		
		return result;
	}
	
	/**
	 * Usuwa nieaktynego uzytkownika z bazy danych
	 * @param login 
	 * @return
	 * @throws IOException 
	 */
//	public boolean deleteFromDB(String login){
//	    PreparedStatement prepStmt;
//	    try {
//	    	  
//	    	prepStmt = conn.prepareStatement("DELETE FROM ActivUsersPerOddzial WHERE ID_ACT = "
//	    	+"(SELECT ID_ACT FROM ActivUsers WHERE Login = ?);");
//	    	prepStmt.setString(1,login);
//	    	prepStmt.execute();
//
//	        prepStmt = conn.prepareStatement("DELETE from ActivUsers where Login = ?;");
//	        prepStmt.setString(1,login);
//	        prepStmt.execute();
//
//	    } catch (SQLException e) {
//	        // TODO Auto-generated catch block
//	        e.printStackTrace();
//	        return false;
//	    }
//	    return true;
//	}
//	
//	/**
//	 * Funkcja zwracajaca wszystkich uzytkownikow (i dane o nich) z bd, wykorzystywane w mechanizmie challengu
//	 * @param login
//	 * @param IP
//	 * @param Time
//	 * @param n
//	 */
//	public void selectAll(String[] login,String[] IP, int Time[], int n, String adres) {
//	    try {
//
//	        java.sql.Statement stat = conn.createStatement();
//	        ResultSet result = stat.executeQuery("SELECT DISTINCT ActivUsers.* FROM ActivUsersPerOddzial INNER JOIN ActivUsers "+
//	        "ON ActivUsers.ID_ACT= ActivUsersPerOddzial.ID_ACT INNER JOIN Beacon "
//	        +"ON Beacon.ID_BEC =ActivUsersPerOddzial.ID_BEC inner join oddzialy on oddzialy.ID_ODD = Beacon.ID_ODD " 
//	        +"where oddzialy.adres ='"+adres+"';");
//	
//	        int i = 0;
//	        while(result.next() && i < n) {
//	            login[i] = result.getString("Login");
//	            IP[i] = result.getString("IP_ADDRES");
//	            Time[i] = result.getInt("Time");
//	            ++i;
//	        }
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	        System.out.println("wyjatek1");
//	    }
//	}
//	
//	/**
//	 * Funkcja zwracajaca liosc uzytkownikow w bazie danych, rownierz potrzebne w tworzeniu strony challengu
//	 * @return
//	 */
//	public int lenghtUsers(){
//		
//		int counter = 0; 
//		
//		try {
//
//		        java.sql.Statement stat = conn.createStatement();
//		        ResultSet result = stat.executeQuery("SELECT * FROM ActivUsers");
//		        while(result.next()) {
//		            counter ++;
//		        }
//		        return counter;
//		        
//		 }catch (SQLException e) {
//		        e.printStackTrace();
//		        return counter;
//		    }
//		
//	}
//	
//	/**
//	 * Metoda sprawdzajaca czy nalezy usunac uzytkownika z dazy danych (usuwa go po 5 minutach)
//	 * @param timeMiliSeconds czas w ktorym uzytkownik zostal dodany do bazy danych
//	 * @param login
//	 */
//	public void testTime(int timeMiliSeconds[], String[] login){
//	    // jesli ponizej pieciu usuwa z bazy
//		for(int i = 0; i < login.length; i++){
//			if(Math.abs(((Math.abs((int)System.currentTimeMillis()) - timeMiliSeconds[i]))) / 1000 / 60 >= 5){
//				deleteFromDB(login[i]);
//			}	
//		}
//	}
//		
//	public static void main(String[] arq) throws IOException {
//		
//		ClientDb db = new ClientDb();
//		db.getAvatarById(9);
//		
//	}
}
