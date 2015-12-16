package model;

/**
 * Klasa przechowujaca dane uzytkownikow otrzymane z bazy danych
 * @author ti05241
 *
 */
public class DataSource {
 
	private String login;
    private String password;
 
    public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * Sprawdzanie poprawnosci podanej kombinacji login, haslo z ta znajdujaca sie w bazie danych
	 * @param password
	 * @return true, false w zaleznosci czy dane sie zgadzaja
	 */
	public boolean checkUser( String password) {
		
		String passwordFromSource = this.password;

		return password.equals(passwordFromSource);
	}
	
//	/**
//	 * Sprawdzanie poprawnosci totpa, oraz danych uztykownika
//	 * @param correct informacja czy login i hsalo sie zgadzaja
//	 * @param totp
//	 * @return
//	 */
//	public boolean logowanie(boolean correct, String totp){
//		
//	    if(correct == true){
//	    	return this.totp.equals(totp);
//	    }else
//	    	return false;
//	}

}