package com.sharinghand.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UsertableService {
	@Autowired
	private UsertableRepository userRepository;
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public boolean save(Usertable user) {
        if(userRepository.existsByUsername((user.getUsername()))) return false;
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        System.out.println("START SAVE");
        userRepository.save(user);
        System.out.println("SAVED");
		return true;
    }
	
	public Usertable findByUsername(String username) {
        return userRepository.findByUsername(username);
	}
	
	public int findLoggedId()	{
		return userRepository.findByUsername(SecurityUtility.getUserName()).getUserid();
	}
	
	public int findLoggedId(String username)	{
		return userRepository.findByUsername(username).getUserid();
	}
}
