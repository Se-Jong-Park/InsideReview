package com.jeonju.movie.movie.service;

import java.util.List;

import com.jeonju.movie.comm.SearchCondition;
import com.jeonju.movie.movie.vo.MovieVO;

public interface MovieService {
	public int movieWrite(MovieVO mvo);
	public int movieUpdate(MovieVO mvo);
	public List<MovieVO> movieList(SearchCondition sc);
	public List<MovieVO> movieRead(String mno);
	public int movieDelete(String mno);
	public int movieCnt(SearchCondition sc);
	public int maxNo();
}
