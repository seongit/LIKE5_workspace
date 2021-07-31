package com.kh.like5.booking.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.like5.booking.model.service.BookingService;
import com.kh.like5.booking.model.vo.Booking;
import com.kh.like5.booking.model.vo.Office;
import com.kh.like5.common.model.vo.Attachment;
import com.kh.like5.common.model.vo.PageInfo;
import com.kh.like5.common.template.Pagination;


@Controller
public class BookingController {
	
	@Autowired
	private BookingService bService;
	
	/**
	 * [신원]오피스예약메인페이지
	 */
	@RequestMapping("bMain.bk")
	public String bMain() {
		return "booking/bMain";
	}
	
	/**
	 * [신원]오피스검색결과
	 */
	@RequestMapping("searchOffice.bk")
	public String searchOffice(Booking b, Model model, HttpServletRequest request) {
		//System.out.println(b.getStartDate());
		//System.out.println(b.getEndDate());
		//System.out.println(b.getBranch());
		ArrayList<Office> list = bService.selectList(b);
		model.addAttribute("list",list);
		model.addAttribute("b", b);
		return "booking/bResult";
		
	}
	
	@RequestMapping("list.bk")
	public String selectListAll(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Office> list = bService.selectListAll(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "booking/aOfficeList";
	}
	
	@RequestMapping("detail.bk")
	public ModelAndView selectOffice(int ono, ModelAndView mv) {
		int officeNo = ono;
		//attachment에도 접근해서 list로 가져와서 화면에 뿌려줘야함...
		Office o = bService.selectOffice(officeNo);
		ArrayList<Attachment> list = bService.selectOfficeAtt(officeNo);
		System.out.println(list);
		if(o != null) {
			mv.addObject("o", o).setViewName("booking/aOfficeDetailView");
			mv.addObject("list", list).setViewName("booking/aOfficeDetailView");
		} else {
			mv.addObject("errorMsg", "조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("insertForm.bk")
	public String enrollForm() {
		return "booking/aOfficeInsertForm";
	}
	
	@RequestMapping("insertOf.bk")
	public String insertOffice(Office o, HttpServletRequest request, MultipartFile[] file, HttpSession session, Model model) {
		String[] facilityArr = request.getParameterValues("facility");
		String facility ="";
		if(facilityArr != null) {
			facility = String.join(",", facilityArr);
		}
		o.setFacility(facility);
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i< file.length; i++) {
			if(!file[i].getOriginalFilename().equals("")) {
				Attachment att = new Attachment();
				if( i == 0) {
					String changeName = saveFile(file[i], session);
					o.setOffImgPath("resources/images/" + changeName);
				} else {
					String changeName = saveFile(file[i], session);
					att.setFilePath("resources/images/" + changeName);
					att.setRefBno(9);
					list.add(att);
				}
			}
		}
		//System.out.println(o);
		//System.out.println(list);
		int result = bService.insertOffice(o, list);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "업로드 성공");
			return "redirect:list.bk";
		} else {
			model.addAttribute("errorMsg","업로드 실패");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile file, HttpSession session) {
		
		String savePath = session.getServletContext().getRealPath("resources/images/");
		
		String originName = file.getOriginalFilename();
		//20210702(년월일) + 23432(랜덤값) + .jpg(원본파일확장자) 
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));//.다음 인덱스부터의 문자열 추출
		
		String changeName = currentTime + "_" + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	@RequestMapping("updateOf.bk")
	public String updateOffice(Office o, Attachment att, HttpServletRequest request, HttpSession session, MultipartFile[] refile, Model model) {
		//facility 부분 가져오기
		String[] facilityArr = request.getParameterValues("facility");
		String facility ="";
		if(facilityArr != null) {
			facility = String.join(",", facilityArr);
		}
		o.setFacility(facility);
		ArrayList<Attachment> list = new ArrayList<>();
		
		/*
		if(o.getOffImgPath() != null) {
			System.out.println(o.getOffImgPath());
			new File(session.getServletContext().getRealPath(o.getOffImgPath())).delete();
			String changeName = saveFile(file, session);
			o.setOffImgPath("resources/images/" + changeName);
		}
		*/
		
		//새 첨부파일
		for(int i=0; i<refile.length; i++) {
			if(!refile[i].getOriginalFilename().equals("")) {
				att = new Attachment();
				if( i==0 ) {
					//대표이미지 기존것  삭제 후 새로 저장
					new File(session.getServletContext().getRealPath(o.getOffImgPath())).delete();
					String changeName = saveFile(refile[i], session);
					o.setOffImgPath("resources/images/" + changeName);
				} else if(att.getFileNo() != 0) {//기존파일이 존재할경우
					System.out.println(att.getFilePath());//왜 두개가 찍히니--> 배열로 안 가져오니까
					String filePath[] = att.getFilePath().split(",");
					//기존 것 삭제
					new File(session.getServletContext().getRealPath(filePath[0])).delete();
					String changeName = saveFile(refile[i], session);
					//att에 저장
					att.setFilePath("resources/images/" + changeName);
					att.setRefFno(o.getOfficeNo());
					att.setFileNo(att.getFileNo());
				} else {
					//기존 변경 없이 새파일을가져왔을경우
					String changeName = saveFile(refile[i], session);
					att.setFilePath("resources/images/" + changeName);
					att.setRefFno(o.getOfficeNo());
				}
				list.add(att);
				System.out.println(list);
			}
		}
		
		int result = bService.updateOffice(o, list);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "업데이트성공");
			return "redirect:/detail.bk?ono="+ o.getOfficeNo();
		} else {
			model.addAttribute("errorMsg", "업데이트실패");
			return "common/errorPage";
		}
	}
	

	/**
	 * 추가부분 - 상세조회 클릭시 연동 페이지(officeDetail)
	 */
	/*첨부파일 조회 + 사진*/
	@RequestMapping("detail.bo")
    public String officeDetailPage(int ono, Model model) {

		ArrayList<Attachment> at = bService.selectList(ono);
		model.addAttribute("at", at);
		model.addAttribute("ono", ono);
		/*System.out.println(at);*/
		
		Office o = bService.selectOffice(ono);
		model.addAttribute("o", o);
		model.addAttribute("ono", ono);
		
        return "booking/officeDetail";
    }
	
	

	@RequestMapping("paymentForm.bk")
	public String paymentForm() {
		/*
		 * 상세정보페이지에서 오피스 번호로 오피스조회랑 예약테이블의 시작일, 끝일 list가져와서 뿌리기
		 * 예약신청시 정보를 booking테이블로 insert 성공시 성공 페이지로 redirect*/
		return "booking/bPayment";
	}

}
