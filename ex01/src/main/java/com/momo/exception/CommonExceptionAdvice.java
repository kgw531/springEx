package com.momo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;



@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	
	/**
	 * 필기R
	 * @param ex
	 * @param model
	 * @return
	 */
	
	@ExceptionHandler(Exception.class)
	public String exception(Exception ex , Model model) {
		System.out.println("Exception ...." + ex.getMessage());
		
		log.info("Exception ....");
		log.debug("로그 테스트 + debug");
		log.error("로그 테스트 + error");
		
		model.addAttribute("exception", ex);
		
		return "/error/error500";
	}
	
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "/error/error404";
	}
}
