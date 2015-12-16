package model;
 
/**
 * Klasa przechywujaca wszystkie informacje podane przez uzytkownika podczas logowania
 * @author ti05241
 *
 */
public class User {
 
    private String login;
    private String password;
    private String totp;

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

	public String getTotp() {
		return totp;
	}

	public void setTotp(String totp) {
		this.totp = totp;
	}
}