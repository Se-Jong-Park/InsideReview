package com.jeonju.movie.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jeonju.movie.comm.Chaebun;
import com.jeonju.movie.comm.EncryptUtils;
import com.jeonju.movie.comm.PageHandler;
import com.jeonju.movie.comm.PasswordUtil;
import com.jeonju.movie.comm.SearchCondtion;
import com.jeonju.movie.user.service.UserService;
import com.jeonju.movie.user.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService uservice;
	
	@RequestMapping(value = "/form")
	public String userForm(HttpSession session, Model model) {
		// String uno = (String) session.getAttribute("uno");
		// 회원객체 초기화(세션에 저장된 회원정보가 있으면 저장)
		UserVO uvo = null;
		if (isValid(session)) {
			// 회원정보가 있는 상태
			// 회원의 전체 정보 조회
			uvo = uservice.selectID((String) session.getAttribute("uid"));
		}
		model.addAttribute("uvo", uvo);
		return "user/form";
	}
		
		// 회원가입
		@PostMapping(value = "/join")
		public String userJoin(@ModelAttribute UserVO uvo, RedirectAttributes rattr) {
			System.out.println("UserController userJoin() 함수 진입 =======");
			System.out.println(uvo);
			// 패스워드 암호화
			String pw = uvo.getUpw();
			// MD5 암호화
			String upw = EncryptUtils.encryptMD5(pw);
			System.out.println("upw >> " + upw);
			uvo.setUpw(upw);
			int maxno = uservice.userMaxno();
			String uno = Chaebun.getUno(maxno);
			System.out.println("uno >> " + uno);
			uvo.setUno(uno);
			int res = uservice.userJoin(uvo);
			System.out.println("res >> " + res);
			if (res != 1) {
				String msg = "U_JOIN_ERR";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/form";
			}
			String msg = "U_JOIN_OK";
			rattr.addFlashAttribute("msg", msg);
			return "redirect:/";
		}
		
		// 비동기방식으로
		@PostMapping(value = "/idChk")
		// 리턴값이 데이터다 (파일명이 아니라)
		@ResponseBody
		public String idChek(String uid) {
			System.out.println("UserController idChek() 함수 진입 =======");
			System.out.println("uid >> " + uid);
			int cnt = uservice.idCheck(uid);
			return String.valueOf(cnt);
		}
		
		// 회원수정
		@PostMapping(value = "/up")
		public String userUpdate(@ModelAttribute UserVO uvo, RedirectAttributes rattr) {
			System.out.println("UserController userUpdate() 함수 진입 =======");
			System.out.println("uvo >> " + uvo);
			int res = uservice.userUpdate(uvo);
			System.out.println("res >> " + res);
			String msg = (res == 1) ? "U_UP_SUC" : "U_UP_ERR";
			rattr.addFlashAttribute("msg", msg);
			// 수정완료 또는 실패 시 수정화면으로 이동!
			return "redirect:/user/form";
		}
		
		@RequestMapping(value = "mypage")
		public String mypage(HttpSession session, RedirectAttributes rattr) {
			if (!isValid(session)) {
				// 비로그인 상태
				String msg = "NO_LOGIN";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/login";
			}
			return "user/mypage";
		}
		// 회원삭제
		@PostMapping(value = "/del")
		public String userDelete(@RequestParam String uno, RedirectAttributes rattr) {
			System.out.println("UserController userDelete() 함수 진입 =======");
			System.out.println("uno >> " + uno);
			int res = uservice.userDelete(uno);
			System.out.println("res >> " + res);
			if (res != 1) {
				String msg = "U_DEL_ERR";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/user/mypage";
			} else {
				String msg = "U_DEL_SUC";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/logout";
			}
		}
		
		//회원조회
		@RequestMapping(value = "list")
		public String userList(SearchCondtion sc, Model model, HttpSession session,RedirectAttributes rattr) {
			System.out.println("UserController userList() 함수 진입 =======");
			System.out.println("sc >> " + sc);
			if(!isValid(session)) {
				String msg = "U_LST_LNK_ERR";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/login";
			}
			//총 회원 수 불러오기(검색조건에 따라)
			int totalCnt = uservice.userCnt(sc);
			//페이징을 위한 페이지핸들러 객체 생성 (총 회원수, 검색조건)
			PageHandler ph = new PageHandler(totalCnt, sc);
			//회원정보 리스트(검색조건에 맞는 회원정보)
			List<UserVO> uList = uservice.userList(sc);
			System.out.println("uList >> " + uList);
			if(uList == null) {
				String msg = "U_LST_ERR";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/user/mypage";
			}
			model.addAttribute("uList", uList);
			model.addAttribute("ph", ph);
			return "/user/list";
		}
		
		//회원 상세조회
		@RequestMapping(value="one")
		public String userOne(String uno, RedirectAttributes rattr, Model model) {
			System.out.println("UserController userOne() 함수 진입 =======");
			System.out.println("uno >> " + uno);
			if(uno == null || uno == "") {
				String msg = "U_ONE_LNK_ERR";
				rattr.addFlashAttribute("msg", msg);
				return "redirect:/user/mypage";
			}
			UserVO uvo = uservice.userOne(uno);
			System.out.println("uvo >> " + uvo);
			if(uvo == null) {
				String msg = "U_ONE_ERR";
				rattr.addFlashAttribute("msg",msg);
				return "redirect:/user/list";
			}
			model.addAttribute("uvo", uvo);
			return "/user/one";
		}
		
		//아이디 찾기
		@PostMapping(value="searchID")
		@ResponseBody //내가 데이터다 
		public String searchID(UserVO uvo) {
			System.out.println("UserController searchID() 함수 진입 =======");
			System.out.println("uvo >> " + uvo);
			String uid = uservice.searchID(uvo);
			System.out.println("uid >> " + uid);
			return uid;
		}
		
		//비밀번호 찾기
		@PostMapping(value="searchPW")
		@ResponseBody //ajax로 반환
		public String searchPW(UserVO uvo) {
			System.out.println("UserController searchPW() 함수 진입 =======");
			System.out.println("uvo >> " + uvo);
			String uid = uservice.searchPW(uvo);
			System.out.println("uid >> " + uid);
			if(!uid.equals(uvo.getUid())) {
				//아이디가 일치하지 않았을 때
				return null;
			}
			//임시 비번 생성
			String tpw = PasswordUtil.makeTempPassword();
			System.out.println("tpw >> " + tpw);
			//비번 암호화
			String upw = EncryptUtils.encryptMD5(tpw);
			System.out.println("upw >> " + upw);
			uvo.setUpw(upw);
			//DB 비번 저장
			int res = uservice.pwUpdate(uvo);
			System.out.println("res >> " + res);
			if(res != 1) {
				return null;
			}
			//사용자 임시비번 전송
			return tpw;
		}

		// session 저장된 회원정보 유무 확인
		private boolean isValid(HttpSession session) {
			String uno = (String) session.getAttribute("uno");
			String uid = (String) session.getAttribute("uid");
			String uname = (String) session.getAttribute("uname");

			return uno != null && uid != null && uname != null;
		}
	}

