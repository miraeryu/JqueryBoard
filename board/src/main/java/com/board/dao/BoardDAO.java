package com.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.BoardVO;

@Repository("boardDAO")
public class BoardDAO {

	@Resource(name="sqlSession")
	private SqlSession sql;
	
	public List<BoardVO> allList(BoardVO vo) {
		return sql.selectList("boardMapper.allList", vo);
	}
	
	public int rowCnt(BoardVO vo) {
		return sql.selectOne("boardMapper.rowCnt", vo);
	}
	
	public BoardVO readOne(int bbsId) {
		return sql.selectOne("boardMapper.readOne", bbsId);
	}
	
	public int newPost(BoardVO vo) {
		return sql.insert("boardMapper.newPost", vo);
	}
	
	public int maxBbsId() {
		return sql.selectOne("boardMapper.maxBbsId");
	}

	public int editPost(BoardVO vo) {
		return sql.update("boardMapper.editPost", vo);
	}

	public int deletePost(int bbsId) {
		return sql.update("boardMapper.deletePost", bbsId);
	}

	public int updateReadCnt(int bbsId) {
		return sql.update("boardMapper.updateReadCnt", bbsId);
	}
}
