package com.momo.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.momo.mapper.BoardMapper;
import com.momo.vo.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class boardTest {
	@Autowired
	BoardMapper boardMapper;
	
	@Test
	public void getList() {
		
		assertNotNull(boardMapper);
		List<BoardVO> list = boardMapper.getListXml();
		
		list.forEach(board ->{
			log.info("boardVO==============================");
			log.info(board.getBno());
			log.info(board.getTitle());
			log.info(board.getContent());
		});
		
	}
	
	@Test
	public void getListXml() {
		List<BoardVO> list = boardMapper.getListXml();
		list.forEach(board ->{
			log.info("boardVO==============================");
			log.info(board.getBno());
			log.info(board.getTitle());
			log.info(board.getContent());
		});
	}
	
	@Test
	public void insert() {
		BoardVO board = new BoardVO();
		board.setTitle("제목1");
		board.setContent("내용1");
		board.setWriter("user01");
		
		int res = boardMapper.insert(board);
		assertEquals(res,1); // 오른 쪽에 초록창이 뜨면 res와1이 같다는 뜻
		
	}
	
	@Test
	public void insertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("제목");
		board.setContent("내용");
		board.setWriter("글쓴이");
		
		int res = boardMapper.insertSelectKey(board);
		log.info("bno : " + board.getBno());
		assertEquals(res, 1);
	}
	
	@Test
	public void getOne() {
		BoardVO board = boardMapper.getOne(57);
		System.out.println("=====================");
		log.info(board);
		
		
	}
	@Test
	public void delete() {
		int res = boardMapper.delete(80);
		assertEquals(res, 1);
		
		
	}
	
	@Test
	public void update() {
		
		int bno = 81;
		BoardVO board = new BoardVO();
		board.setBno(bno);
		board.setTitle("제목 수정");
		board.setContent("내용 수정");
		board.setWriter("글쓴이");
		
		int res = boardMapper.update(board);
		assertEquals(res, 1);
		
		BoardVO getBoard = boardMapper.getOne(bno);
		assertEquals("제목 수정", getBoard.getTitle());
	}
	
	@Test
	public void getTotalCnt() {
		int res = boardMapper.getTotalCnt();
		log.info(res);
	}
}
