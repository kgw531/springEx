package com.momo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.momo.vo.Member;
import com.momo.vo.MemberList;

/**
 * 
 * 스프링 MVC에서 제공하고 있는 어노테이션을 이용하여 controller를 작성해보자
 * 
 * 톰캣 서버를 실행하면 web.xml파일의 설정을 읽어 서버를 시작한다.
 * web.xml파일에 기술되어 있는 servlet-context.xml 파일의 component-scan에 등록된 패키지
 * 클래스를 조사라고 객체설정에 사용되는 어노테이션 들을 가진 클래스를 객체로 생성하고 관리한다.
 * 
 * mvc에서 사용되는 어노테이션을 학습해보자.
 * 
 * controller : 해당클래스의 인스턴스를 스프링의 빈으로 등록하고 컨트롤러로 사용한다.
 * 
 * 
 * 스프링 mvc controller의 장점
 * 1. 파라메터를 자동수집
 * 2. url매핑을 메서드 단위로 처리
 * 3. 화면에 전달할 데이터는 model에 담아주기만 하면 됨
 * 4. 간단한 페이지 전환(forward, redirect)
 * 5. 상속/인터페이스 방식 대신에 어노테이션만으로도 필요한 설정 가능
 *
 */
@RequestMapping("/mapping/*")
@Controller
public class MappingController {
	
	/**
	 * requestmmapping : 클래스 상단에 적용 시 현재 클래스의 모든 메서드들의 기본  url 경로를 지정한다. 메서드 상단에 
	 * 적용시 메서드의 url 경로를  지정한다.
	 * 
	 * get방식과 post방식 모두 처리하고 싶은 경우 배열로 받을 수 있다.
	 * 
	 * /mapping/reqeustMapping uri를 get 메서드로 호출하면 해당 메서드가 실행된다.
	 * @return
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String requestMapping() {
		return "mapping";
	}
	
	
	/**
	 * /mapping/requestMapping uri
	 * 
	 * @return
	 */
	@RequestMapping(value="/requestMapping", method= {RequestMethod.GET,RequestMethod.POST}) // get 방식과 post방식 모두 가능하다.
	public String requestMapping2() {
		System.out.println("/requestMapping 호출");
		return "mapping";
	}
	
	@GetMapping("/getMapping")
	public String getMapping(@RequestParam("name") String name, @RequestParam("age") int age, Model model){
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		System.out.println("name : " + name	);
		System.out.println("age : " + age);
		return "mapping";
	}
	
	/**
	 *  파라메터를 Vo, Dto에 수집한 경우, 별도의 저장 없이 화면까지 전달된다.
	 *  
	 *  화면에 값을 전달하고 싶은 경우 model객체를 매개변수로 받아 addAttribute()메서드를 이용한다.
	 *  model.addAttribute("이름", "값")
	 *  
	 * @return
	 */
	
	@GetMapping("/getMappingVO")
	public String getMappingVo(Member member, Model model) {
		model.addAttribute("message","파라메터 자동 수집");
		return "mapping";
	}
	
	@GetMapping("/getMappingArr")
	public String getMappingArr(@RequestParam("ids") String[] ids) {
		for(String id : ids) {
			System.out.println("ids : " + id);
		}
		return "mapping";
		
	}
	
	@GetMapping("/getMappingList")
	public String getMappingList(@RequestParam("ids") List<String> ids) {
		/**
		 * forEach : 익명의 함수를 이용한 컬렉션의 반복처리
		 * collection.forEach(변수 -> 반복처리(변수))
		 */
		ids.forEach(id->{
			System.out.println("ids : " + id);
			
		});
		return "mapping";
		
	}
	
	@GetMapping("getMappingMemberList")
	public String getMappingMemberList(MemberList list){
		System.out.println(list);
		return "mapping";
	}
	
	
	
}
















