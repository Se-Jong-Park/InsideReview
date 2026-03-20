package com.jeonju.movie.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.movie.comm.SearchCondtion;
import com.jeonju.movie.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private SqlSession session;
	private String namespace = "com.kmove.app.mapper.UserMapper.";
	
	@Override
	public int userJoin(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userJoin() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		int res = session.insert(namespace + "userJoin", uvo);
		System.out.println("res >> " + res);
		return res;
	}

	//
	@Override
	public int userMaxno() {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userMaxno() 함수 진업 ========");
		int maxno = session.selectOne(namespace + "maxno");
		System.out.println("maxno >> " + maxno);
		return maxno;
	}

	//ID 일치 확인
	@Override
	public int idCheck(String uid) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl idCheck() 함수 진입 =======");
		System.out.println("uid >> " + uid);
		int res = session.selectOne(namespace + "idCheck", uid);
		System.out.println("res >> " + res);
		return res;
	}

	//ID 일치 회원 조회
	@Override
	public UserVO selectID(String uid) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl selectID() 함수 진입 =======");
		System.out.println("uid >> " + uid);
		UserVO uvo = session.selectOne(namespace + "selectID", uid);
		System.out.println("uvo >> " + uvo);
		return uvo;
	}

	@Override
	public int userUpdate(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userUpdate() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		int res = session.update(namespace + "userUpdate", uvo);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public int userDelete(String uno) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userDelete() 함수 진입 =======");
		System.out.println("uno >> " + uno);
		int res = session.update(namespace + "userDelete", uno);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public List<UserVO> userList(SearchCondtion sc) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userList() 함수 진입 =======");
		System.out.println("sc >> " + sc);
		List<UserVO> uList = session.selectList(namespace + "userList", sc);
		System.out.println("uList >> " + uList);
		return uList;
	}

	@Override
	public int userCnt(SearchCondtion sc) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userCnt() 함수 진입 =======");
		System.out.println("sc >> " + sc);
		int totalCnt = session.selectOne(namespace + "userCnt", sc);
		System.out.println("totalCnt >> " + totalCnt);
		return totalCnt;
	}

	@Override
	public UserVO userOne(String uno) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl userOne() 함수 진입 =======");
		System.out.println("uno >> " + uno);
		UserVO uvo = session.selectOne(namespace + "userOne", uno);
		System.out.println("uvo >> " + uvo);
		return uvo;
	}

	@Override
	public String searchID(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl searchID() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		String uid = session.selectOne(namespace + "searchID", uvo);
		System.out.println("uid >> " + uid);
		return uid;
	}

	@Override
	public String searchPW(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl searchPW() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		String uid = session.selectOne(namespace + "searchPW", uvo);
		System.out.println("uid >> " + uid);
		return uid;
	}

	@Override
	public int pwUpdate(UserVO uvo) {
		// TODO Auto-generated method stub
		System.out.println("UserDAOImpl pwUpdate() 함수 진입 =======");
		System.out.println("uvo >> " + uvo);
		int res = session.update(namespace + "pwUpdate", uvo);
		System.out.println("res >> " + res);
		return res;
	}
	
}
