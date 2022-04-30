package com.sharinghand.login;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UsertableRepository extends JpaRepository<Usertable, Integer> {
	Usertable findByUsername(String username);
	boolean existsByUsername(String username);
}
