package kr.ac.kopo.gameshop.service;

import kr.ac.kopo.gameshop.dao.MemberDao;
import kr.ac.kopo.gameshop.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberDao dao;

    @Override
    public boolean login(Member member) {
        Member item = dao.login(member);
        if (item != null) {
            member.setId(item.getId());
            member.setPasswd(null);
            member.setName(item.getName());
            member.setRegDate(null);
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean checkId(String id) {
        if(dao.checkId(id) > 0){
            return false;
        }else{
            return true;
        }

    }

    @Override
    public void signup(Member member) {
        dao.signup(member);
    }
}
