package com.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.service.BoardService;
import com.board.vo.BoardVO;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Resource(name="boardService")
	private BoardService boardService;
	
	// 전체보기 및 메인화면
	@RequestMapping("/")
	public String list(@ModelAttribute BoardVO vo, Model model) {
		vo.setAllPostCnt(boardService.rowCnt(vo));		// 전체 행 개수 세팅
		if (vo.getNowPage() == 0) {						// 처음 로딩할 경우
			vo.setNowPage(1);
		}
		int endPage = ((int) Math.ceil((double)vo.getNowPage()/(double)vo.getDisplayPage())) * 3;
		int startPage = endPage - 2;
		vo.setStartPage(startPage);
		if (endPage > vo.getMaxPageCnt()) {
			vo.setEndPage(vo.getMaxPageCnt());
		} else {
			vo.setEndPage(endPage);
		}
		List<BoardVO> list = boardService.allList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "views/list.tiles";
	}
	
	// 상세보기
	@RequestMapping("/readPost")
	public String readPost(@ModelAttribute BoardVO vo, Model model) {
		BoardVO readPost = boardService.readOne(vo.getBbsId());
		model.addAttribute("post", readPost);
		model.addAttribute("vo", vo);
		if (readPost != null) {
			boardService.updateReadCnt(vo.getBbsId());
			logger.info("***********조회 수 업데이트**********");
		}
		return "views/readPost.tiles";
	}
	
	// 새글작성 폼
	@RequestMapping("/insertForm")
	public String insertForm() {
		return "views/insertForm.tiles";
	}
	
	//새글작성
	@ResponseBody
	@RequestMapping("/insertPost")
	public int newPost(@RequestBody BoardVO vo) {
		vo.setBbsId(boardService.maxBbsId());
		int result = boardService.newPost(vo);
		return result;
	}
	
	// 글 수정 폼
	@RequestMapping("/editForm")
	public String editForm(@ModelAttribute BoardVO vo, Model model) {
		BoardVO readPost = boardService.readOne(vo.getBbsId());
		model.addAttribute("post", readPost);
		model.addAttribute("vo", vo);
		return "views/editForm.tiles";
	}
	
	// 글 수정
	@ResponseBody
	@RequestMapping(value = "/editPost", method = RequestMethod.POST)
	public int editPost(@RequestBody BoardVO vo) {
		int result = boardService.editPost(vo);
		return result;
	}
	
	// 글 삭제
	@ResponseBody
	@RequestMapping("/deletePost")
	public int deletePost(@RequestParam("bbsId") int bbsId) {
		int result = boardService.deletePost(bbsId);
		return result;
	}
}
