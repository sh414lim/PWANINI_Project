package com.pawnini.view.member;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.member.MemberService;
import com.pawnini.model.product.ProductDTO;
import com.pawnini.model.product.ProductService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private ProductService proSercvce;
	
	
	/*//로그인 Interceptor용
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@ModelAttribute("member") MemberDTO dto, HttpServletRequest request, Model model) throws Exception {
		
		MemberDTO resultDTO = service.login(dto);
		
		if(resultDTO != null && !resultDTO.getMember_id().equals("") && !resultDTO.getMember_pwd().equals("")) {
			System.out.println("login 성공");
			request.getSession().setAttribute("member", resultDTO);
			return "main";
		} else {
			System.out.println("login 실패");
			model.addAttribute("msg", "아이디와 비밀번호가 불일치합니다.");
			return "Login";
		}
	}*/
	
	//로그인
	@RequestMapping(value="/login.do")
	public String login(MemberDTO dto, HttpSession session,RedirectAttributes rttr, Model model, ProductDTO pdto) throws Exception {
		
		MemberDTO member = service.login(dto);
		model.addAttribute("productMain",proSercvce.getProductMain(pdto));
		model.addAttribute("productSale",proSercvce.getProductSale(pdto));
		
		if(member != null) {
			session.setAttribute("member", member);
			return "main";
		} else {
			rttr.addFlashAttribute("msg", false);
			return "Login";
		}
	}
	
	
	/*	//로그아웃 Intercepter용
	@RequestMapping(value="/logout.do")
	public String logout(@ModelAttribute("member") MemberDTO dto, 
						HttpServletRequest request, Model model) throws Exception {
		request.getSession().removeAttribute("member");
		request.getSession().invalidate();
		
		return "main";
	}	*/
		
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, Model model, ProductDTO pdto) throws Exception {
		model.addAttribute("productMain",proSercvce.getProductMain(pdto));
		model.addAttribute("productSale",proSercvce.getProductSale(pdto));
		session.invalidate();
		return "main";
	}
	
	//회원가입
	@RequestMapping(value="/insertMember.do")
	public String insertMember(MemberDTO dto) {
		service.insertMember(dto);
		
		return "main";
	}
	
	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value="/checkID.do")
	public int checkID(MemberDTO dto) {
		int checkID = service.checkID(dto);
		return checkID;
	}
	@ResponseBody
	@RequestMapping(value="/checkMember.do")
	public int checkMember(MemberDTO dto) {
		int checkMember = service.checkMember(dto);
		return checkMember;
	}
	
	// 회원정보 수정
	@RequestMapping(value="/updateMember.do")
	public String updateMember(MemberDTO dto) {
		service.updateMember(dto);
		return "Mypage";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(MemberDTO dto) {
		service.deleteMember(dto);
		return "main";
	}
	// 관리자 회원 탈퇴 처리
	@RequestMapping(value="/kickMember.do")
	public String kickMember(MemberDTO dto) {
		service.deleteMember(dto);
		return "redirect:getMemberList.do";
	}
	
	// 멤버 리스트 관리자 페이지
	@RequestMapping(value="/getMemberList.do")
	public String getMemberList(MemberDTO dto, Model model) {
		model.addAttribute("memberList", service.getMemberList(dto));
		return "admin/member/memberList";
	}
	
	//이메일 인증
		@RequestMapping(value="/emailCheck.do", method=RequestMethod.GET)
		@ResponseBody
		public String  mailCheck(String member_email) throws Exception {
			System.out.println("이메일 데이터 전송 확인, 인증번호 : "+member_email);
			
			
			//인증번호 (난수) 생성;
			char[] charSet = new char[] { 
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
					'a', 'b','c','d','e','f','g','h','i','j','k','l','m',
					'n', 'o','p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
					'U', 'V', 'W', 'X', 'Y', 'Z' };
			int idx;
			StringBuffer checkVal = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				idx = (int) (charSet.length * Math.random());
				checkVal.append(charSet[idx]);
			}
			
			/* 이메일 보내기*/
			String setFrom = "pawninishop@gmail.com";
			String toMail = member_email;
			String title = "PAWNINI - 회원가입 인증 이메일 입니다! ";
			String content = "PAWNINI를 방문해주셔서 감사합니다. 🐥<br><br>인증번호는 <span style='font-weight:bold; color:navy;'>"+checkVal+"</span>입니다. 🐾<br>해당 인증번호를 인증번호 확인란에 기입하여 주세요<br><br><br>PAWNINI Team  🐾";

			
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String check = checkVal.toString();
		
		return check;

		
		}
		
}















