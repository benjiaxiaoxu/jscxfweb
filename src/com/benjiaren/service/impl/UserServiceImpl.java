package com.benjiaren.service.impl;

import com.benjiaren.bean.User;
import com.benjiaren.dao.UserDAO;
import com.benjiaren.service.UserService;

public class UserServiceImpl implements UserService{
	
	public User findUserByName(String name) {
		// TODO Auto-generated method stub
		return new UserDAO().getUserName(name);
	}

}
