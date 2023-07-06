package com.momo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.momo.service.BoardService;
import com.momo.vo.BoardVO;
import com.momo.vo.Criteria;

import lombok.extern.log4j.Log4j;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	
	/**
	 * 파라메터를 자동수집 -> 기본생성자를 이용하여 객체를 생성 -> setter메서드를 이용해서 세팅
	 * @param cri
	 * @param model
	 */
	@GetMapping("list")
	public void getList(Criteria cri,Model model) {
		List<BoardVO> list = boardService.getListXml(cri,model);
		log.info("===============list");
		log.info("cri : " + cri);
		log.info("list : " + list);
		
		
		model.addAttribute("list", boardService.getListXml(cri, model));

	}
	
	@GetMapping("view")
	public void getOne(Model model, int bno) {
		BoardVO board= boardService.getOne(bno);
		log.info(board);
		model.addAttribute("board", board);
		
	}
	

	
	@GetMapping("edit")
	public String edit(BoardVO paramVO, Model model) {
		BoardVO board= boardService.getOne(paramVO.getBno());
		model.addAttribute("board", board);
		return "/board/write";
	}
	
	@PostMapping("editAction")
	public String editAction(Model model, BoardVO board, RedirectAttributes rttr) {
		// 수정
		int res = boardService.update(board);
		
		
		
		if(res > 0) {
			//model.addAttribute("msg", "수정되었습니다.");
			rttr.addFlashAttribute("msg","수정되었습니다");
			return "redirect:/board/view?bno=" + board.getBno();
			
		}else {
			
			model.addAttribute("msg", "수정 중 에러가 발생했습니다.");
			return "/board/message";
		}
		
//		BoardVO board = new BoardVO();
//		board.setBno(bno);
//		board.setTitle(title);
//		board.setContent(content);
		
		
	}

	@GetMapping("write")
	public void write(Model model) {

		
	}
	
	/**
	 * RedirectAttributes
	 * 
	 * addAttribute : 주소 표시줄에 표시되어 넘어간다(매개변수로 넘어간다.)
	 * addFlashAttribute : 세션에 저장 후 페이지 전환(주소 표시줄에 표시되지 않는다.)
	 * 
	 */
	@PostMapping("write")
	public String writeAction(BoardVO board, RedirectAttributes rttr, Model model) {
		int res = boardService.insertSelectKey(board);
		
		String msg ="";
		if(res > 0) {
			msg = board.getBno() + "번 등록되었습니다";
			//rttr.addAttribute("msg",msg);
			// 새로 고침시 유지되지 않는다.
			rttr.addFlashAttribute("msg", msg);
			return "redirect:/board/list";
		}else {
			msg = "등록 중 예외가 발생";
			model.addAttribute("msg", msg);
			return "/board/message";
		}
	}
	
	@PostMapping("delete")
	public String delete(BoardVO board, RedirectAttributes rttr, Model model) {
		int res = boardService.delete(board.getBno());
		if(res > 0) {
			rttr.addFlashAttribute("msg","삭제되었습니다.");
			return "redirect:/board/list";
			
		}else {
			model.addAttribute("msg","삭제 중 예외가 발생하였습니다.");
			return "/board/message";
		}
	}
	
	
}
