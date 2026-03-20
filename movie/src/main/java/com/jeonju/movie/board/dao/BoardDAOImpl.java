package com.jeonju.movie.board.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeonju.movie.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NS = "com.jeonju.movie.board.mapper.BoardMapper.";
	
	@Override
	public List<BoardVO> getBoardList(String mno) {
		return sqlSession.selectList(NS + "getBoardList", mno);
	}
	
	@Override
	public List<BoardVO> getRecentBoardList() {
		return sqlSession.selectList(NS + "getRecentBoardList");
	}
	
	@Override
	public BoardVO getBoardDetail(String bno) {
		return sqlSession.selectOne(NS + "getBoardDetail", bno);
	}
	
	@Override
	public void updateBcnt(String bno) {
		sqlSession.update(NS + "updateBcnt", bno);
	}
	
	@Override
	public int getMaxNo() {
		return sqlSession.selectOne(NS + "getMaxNo");
	}
	
	@Override
	public void insertBoard(BoardVO vo) {
		sqlSession.insert(NS + "insertBoard", vo);
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		sqlSession.update(NS + "updateBoard", vo);
	}
	
	@Override
	public void deleteBoard(String bno) {
		sqlSession.update(NS + "deleteBoard", bno);
	}
}
