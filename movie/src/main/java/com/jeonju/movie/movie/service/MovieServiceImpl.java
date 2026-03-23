package com.jeonju.movie.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeonju.movie.comm.SearchCondition;
import com.jeonju.movie.movie.dao.MovieDAO;
import com.jeonju.movie.movie.vo.MovieVO;
import com.mysql.cj.Session;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDAO mdao;

	@Override
	public int movieWrite(MovieVO mvo) {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl movieList() 함수진입 >>>> ");
		System.out.println("mvo >> " + mvo);
		int res = mdao.movieWrite(mvo);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public int movieUpdate(MovieVO mvo) {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl movieUpdate() 함수진입 >>>> ");
		System.out.println("mvo >> " + mvo);
		int res = mdao.movieUpdate(mvo);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public List<MovieVO> movieList(SearchCondition sc) {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl movieList() 함수진입 >>>> ");
		System.out.println("sc >> " + sc);
		List<MovieVO> mList = mdao.movieList(sc);
		System.out.println("mList >> " + mList);
		return mList;
	}

	@Override
	public List<MovieVO> movieRead(String mno) {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl movieRead() 함수진입 >>>> ");
		System.out.println("mno >> " + mno);
		//조회수 증가
		int res = mdao.increaseCnt(mno);
		System.out.println("res >> " + res);
		List<MovieVO> mList = mdao.movieRead(mno);
		System.out.println("mList >> " + mList);
		return mList;
	}

	@Override
	public int movieDelete(String mno) {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl movieDelete() 함수진입 >>>> ");
		System.out.println("mno >> " + mno);
		int res = mdao.movieDelete(mno);
		System.out.println("res >> " + res);
		return res;
	}

	@Override
	public int movieCnt(SearchCondition sc) {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl movieCnt() 함수진입 >>>> ");
		System.out.println("sc >> " + sc);
		int totalCnt = mdao.movieCnt(sc);
		System.out.println("totalCnt >> " + totalCnt);
		return totalCnt;
	}

	@Override
	public int maxNo() {
		// TODO Auto-generated method stub
		System.out.println("MovieServiceImpl maxNo() 함수진입 >>>> ");
		int maxno = mdao.maxNo();
		System.out.println("maxno >> " + maxno);
		return maxno;
	}
	
}
