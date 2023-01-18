package kr.ac.kopo.gameshop.service;

import kr.ac.kopo.gameshop.model.Member;

public interface MemberService {
    boolean login(Member item);

    boolean checkId(String id);

    void signup(Member member);
}
