package com.ssafy.member.model.service;

import com.ssafy.member.model.MemberDto;

public interface MemberService {

	int idCheck(String userId) throws Exception;
	int joinMember(MemberDto memberDto) throws Exception;
	MemberDto loginMember(String userId, String userPwd) throws Exception;
	int modify(String userId, String userPwd, String emailId, String emailDomain) throws Exception;
	int delete(String userId) throws Exception;
}