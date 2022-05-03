package com.sharinghand.request;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RequesttableRepository extends JpaRepository<Requesttable, Integer> {
	List<Requesttable> findAllByRequestby(int requestby);
	Requesttable findByRequestid(int requestid);
}
