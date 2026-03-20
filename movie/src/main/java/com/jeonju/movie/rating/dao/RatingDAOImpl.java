package com.jeonju.movie.rating.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.movie.movie.vo.MovieVO;
import com.jeonju.movie.rating.vo.RatingVO;

@Repository
public class RatingDAOImpl implements RatingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NS = "com.jeonju.movie.rating.mapper.RatingMapper.";
	
	@Override
	public void insertRating(RatingVO vo) {
		sqlSession.insert(NS + "insertRating", vo);
	}
	
	@Override
	public int getMaxNo() {
		return sqlSession.selectOne(NS + "getMaxNo");
	}
	
	@Override
	public int checkRating(RatingVO vo) {
		return sqlSession.selectOne(NS + "checkRating", vo); 
	}
	
	@Override
	public double getAvgScore(String mno) {
		return sqlSession.selectOne(NS + "getAvgScore", mno);
	}
	
	@Override
	public List<MovieVO> getRankingList() {
		return sqlSession.selectList(NS + "getRankingList");
	}
}
