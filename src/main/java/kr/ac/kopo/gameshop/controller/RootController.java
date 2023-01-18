package kr.ac.kopo.gameshop.controller;

import kr.ac.kopo.gameshop.model.Game;
import kr.ac.kopo.gameshop.model.Member;
import kr.ac.kopo.gameshop.model.Search;
import kr.ac.kopo.gameshop.service.GameService;
import kr.ac.kopo.gameshop.service.MemberService;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class RootController {
    @Autowired
    GameService service;
    @Autowired
    MemberService memberService;

    @RequestMapping("/")
    public String index() {
        return "index";
    }


    @RequestMapping("/game/list")
    public String list(Model model, Search search) {
        List<Game> list = service.list(search);
        model.addAttribute("list", list);

        log.info("search.category{}", search.getCategory());
        log.info("search.keywords{}", search.getKeywords());
        return "/game/list";
    }

    @GetMapping("/game/add")
    public String add() {
        return "/game/add";
    }

    @PostMapping("/game/add")
    public String add(Game item) {
        service.add(item);

        return "redirect:/game/list";
    }

    @RequestMapping("/game/delete/{id}")
    public String delete(@PathVariable int id) {
        service.delete(id);

        return "redirect:/game/list";
    }

    @GetMapping("/game/update/{id}")
    public String update(@PathVariable int id, Model model) {
        Game item = service.item(id);
        log.info("item", item);
        return "/game/update";

    }

    @PostMapping("/game/update/{id}")
    public String update(@PathVariable int id, Game item) {
        item.setId(id);

        service.update(item);
        return "redirect:/game/list";
    }

    @GetMapping("/login")
    public String login() {

        return "/login";
    }

    @PostMapping("/login")
    public String login(Member member, HttpSession session) {

        log.info("item.id{}", member.getId());
        log.info("item.passwd{}", member.getPasswd());
        if (memberService.login(member)) {
            session.setAttribute("member", member);

            return "redirect:/";
        } else {
            return "redirect:/login";

        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();

        return "redirect:/";
    }
    @GetMapping("/signup")
    public String signup(){
        return "/signup";
    }

    @PostMapping("/signup")
    public String signup(Member member){
        memberService.signup(member);

        return "redirect:/login";

    }

    @PostMapping("/checkId/{id}")
    @ResponseBody
    public String checkId(@PathVariable String id){
        if(memberService.checkId(id)){
            return "OK";
        }else {
            return "FAIL";
        }

    }

}
