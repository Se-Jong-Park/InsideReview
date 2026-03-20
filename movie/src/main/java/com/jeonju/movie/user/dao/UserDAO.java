package com.jeonju.movie.user.dao;

import java.util.List;

import com.jeonju.movie.comm.SearchCondtion;
import com.jeonju.movie.user.vo.UserVO;

public interface UserDAO {
	public int userMaxno();//채번
	public int userJoin(UserVO uvo); //회원가입
	public int idCheck(String uid); //아이디중복확인
	public UserVO selectID(String uid); //ID 일치 회원 조회
	public int userUpdate(UserVO uvo); //회원수정
	public int userDelete(String uno); //회원탈퇴
	public List<UserVO> userList(SearchCondtion sc); //회원전체조회
	public int userCnt(SearchCondtion sc); //전체회원수
	public UserVO userOne(String uno); //회원상세조회
	public String searchID(UserVO uvo); //아이디 찾기
	public String searchPW(UserVO uvo); //비밀번호 찾기
	public int pwUpdate(UserVO uvo); //임시 비밀번호 저장
}