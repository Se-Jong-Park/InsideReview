package com.jeonju.movie.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.movie.comm.SearchCondtion;
import com.jeonju.movie.user.dao.UserDAO;
import com.jeonju.movie.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO udao;
	
	@Override
	public int userJoin(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userJoin() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		int res = udao.userJoin(uvo);
		return res;
	}

	//채번
	@Override
	public int userMaxno() {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userMaxno() 함수 진입 =======");
		int maxno = udao.userMaxno();
		System.out.println("maxno >> " + maxno);
		return maxno;
	}

	//아이디 중복 확인
	@Override
	public int idCheck(String uid) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl idCheck() 함수 진입 =======");
		System.out.println("uid >> " + uid);
		int res = udao.idCheck(uid);
		System.out.println("res >> " + res);
		return res;
	}
	
	//ID 일치 회원 조회
	@Override
	public UserVO selectID(String uid) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl selectID() 함수 진입 =======");
		System.out.println("uid >> " + uid);
		UserVO uvo = udao.selectID(uid);
		System.out.println("uvo >> " + uvo);
		return uvo;
	}

	@Override
	public int userUpdate(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userUpdate() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		int res = udao.userUpdate(uvo);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public int userDelete(String uno) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userDelete() 함수 진입 =======");
		System.out.println("uno >> " + uno);
		int res = udao.userDelete(uno);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public List<UserVO> userList(SearchCondtion sc) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userList() 함수 진입 =======");
		System.out.println("sc >> " + sc);
		List<UserVO> uList = udao.userList(sc);
		System.out.println("uList >> " + uList);
		return uList;
	}

	@Override
	public int userCnt(SearchCondtion sc) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userCnt() 함수 진입 =======");
		System.out.println("sc >> " + sc);
		int totalCnt = udao.userCnt(sc);
		System.out.println("totalCnt >> " + totalCnt);
		return totalCnt;
	}

	@Override
	public UserVO userOne(String uno) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl userOne() 함수 진입 =======");
		System.out.println("uno >> " + uno);
		UserVO uvo = udao.userOne(uno);
		System.out.println("uvo >> " + uvo);
		return uvo;
	}

	@Override
	public String searchID(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl searchID() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		String uid = udao.searchID(uvo);
		System.out.println("uid >> " + uid);
		return uid;
	}

	@Override
	public String searchPW(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl searchPW() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		String uid = udao.searchPW(uvo);
		System.out.println("uid >> " + uid);
		return uid;
	}

	@Override
	public int pwUpdate(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserServiceImpl pwUpdate() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		int res = udao.pwUpdate(uvo);
		System.out.println("res >> " + res);
		return res;
	}
	
}