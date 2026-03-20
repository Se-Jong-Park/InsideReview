package com.jeonju.movie.user.service;

import java.util.List;

import com.jeonju.movie.comm.SearchCondtion;
import com.jeonju.movie.user.vo.UserVO;

public interface UserService {
	public int userJoin(UserVO uvo);
	public int userMaxno();
	public int idCheck(String uid);
	public UserVO selectID(String uid);
	public int userUpdate(UserVO uvo);
	public int userDelete(String uno);
	public List<UserVO> userList(SearchCondtion sc);
	public int userCnt(SearchCondtion sc);
	public UserVO userOne(String uno);
	public String searchID(UserVO uvo);
	public String searchPW(UserVO uvo);
	public int pwUpdate(UserVO uvo);
}