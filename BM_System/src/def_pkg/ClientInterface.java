package def_pkg;

import java.util.List;

public interface ClientInterface {
	String getClientID();
	String getFName();
	String getLName();
	String getFatherName();
	String getMotherName();
	String getAadhar();
	String getDOB();
	String getPhone();
	String getEmail();
	String getAddress();
	int transferMoney(String recv_acc, int amount);
	String doCardlessCashWithdrawal(Bank_Account account, String amount, String pin);
	int changePassword(String curr_pass, String new_pass_1, String new_pass_2, String acc_num);
	List<Transaction_History> getTransactions(String acc_num, String From, String To);
}

