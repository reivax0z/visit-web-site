package reivax.norac.website.caches;

import java.util.List;

import reivax.norac.website.dto.UsersDTO;

public class UserCache extends Cache<UsersDTO> {

	private static UserCache instance = new UserCache();
	
	public static UserCache getInstance(){
		return instance;
	}
	
	@Override
	protected List<UsersDTO> refreshAllAction() {
		return webSiteEJB.getAllUsersFromDb();
	}

	@Override
	protected void addAction(UsersDTO element) {
		// TODO Auto-generated method stub
	}

}
