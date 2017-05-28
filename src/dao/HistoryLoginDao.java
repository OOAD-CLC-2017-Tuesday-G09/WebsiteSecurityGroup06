package dao;

import java.util.List;

import model.HistoryLogin;
import model.User;

public interface HistoryLoginDao {
	public void addHistory(HistoryLogin h);
	public void updateHistory(HistoryLogin h );
	public boolean checkUser(String username);
	public List<HistoryLogin> getList(String username);
	public HistoryLogin getHitory(String username);
}
