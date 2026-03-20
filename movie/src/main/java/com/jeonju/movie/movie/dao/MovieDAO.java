package com.jeonju.movie.movie.dao;

import java.util.List;

import com.jeonju.movie.movie.vo.MovieVO;

public interface MovieDAO {
	List<MovieVO> getMovieList();
	
	MovieVO getMovieDetail(String mno);
}
