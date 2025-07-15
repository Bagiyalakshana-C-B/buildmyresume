package com.bootrebu.resumebuilder.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bootrebu.resumebuilder.Model.Resume;

public interface ResumeRepo extends JpaRepository<Resume,Integer> {
	 Resume findByUserId(int userId);
}
