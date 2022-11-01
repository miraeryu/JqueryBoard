package com.board.service;


import java.util.List;


import org.springframework.stereotype.Service;

import com.board.vo.BoardVO;

public interface BoardService {
	
	//전체 조회
	public List<BoardVO> allList(BoardVO vo);
	
	//글 갯수 조회
	public int rowCnt(BoardVO vo);
	
	//상세 조회
	public BoardVO readOne(int bbsId);
		
	//새글 쓰기
	public int newPost(BoardVO vo);
	
	//maxBbsId 값 구하기
	public int maxBbsId();
		
	//글 수정
	public int editPost(BoardVO vo);
		
	//글 삭제
	public int deletePost(int bbsId);
		
	//조회수 업데이트
	public int updateReadCnt(int bbsId);

}
