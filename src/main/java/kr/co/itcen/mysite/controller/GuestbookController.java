package kr.co.itcen.mysite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.mysite.repository.GuestbookDao;
import kr.co.itcen.mysite.vo.GuestbookVo;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
	@Autowired
	private GuestbookDao guestbookDao;

	@RequestMapping(value={"", "/list"}, method = RequestMethod.GET)
	public String index(Model model) {
		List<GuestbookVo> list = guestbookDao.getList();
		model.addAttribute("list",list);
		return "guestbook/list";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String insert(GuestbookVo vo) {
		guestbookDao.insert(vo);
		return "redirect:/guestbook";
	}

	@RequestMapping(value = "/delete/{no}", method = RequestMethod.GET)
	public String delete(@PathVariable("no") Long no, Model model) {
		model.addAttribute("no",no);
		return "guestbook/delete";
	}

	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute GuestbookVo vo) {
		guestbookDao.delete(vo);
		return "redirect:/guestbook";
	}

}
