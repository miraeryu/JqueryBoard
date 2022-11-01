package com.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.service.BoardService;
import com.board.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> allList(BoardVO vo) {
		return boardDAO.allList(vo);
	}
	
	@Override
	public int rowCnt(BoardVO vo) {
		return boardDAO.rowCnt(vo);
	}

	@Override
	public BoardVO readOne(int bbsId) {
		return boardDAO.readOne(bbsId);
	}

	@Override
	public int newPost(BoardVO vo) {
		return boardDAO.newPost(vo);
	}
	
	@Override
	public int maxBbsId() {
		return boardDAO.maxBbsId();
	}

	@Override
	public int editPost(BoardVO vo) {
		return boardDAO.editPost(vo);
	}

	@Override
	public int deletePost(int bbsId) {
		return boardDAO.deletePost(bbsId);
	}

	@Override
	public int updateReadCnt(int bbsId) {
		return boardDAO.updateReadCnt(bbsId);
	}

}
