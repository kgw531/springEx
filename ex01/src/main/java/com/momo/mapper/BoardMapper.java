package com.momo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.ui.Model;

import com.momo.vo.BoardVO;
import com.momo.vo.Criteria;

public interface BoardMapper {

	
	public List<BoardVO> getListXml(Criteria cri);
	
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board);
	
	public BoardVO getOne(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int getTotalCnt(Criteria cri);

}
