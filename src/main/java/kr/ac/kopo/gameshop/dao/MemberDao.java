package kr.ac.kopo.gameshop.dao;

import kr.ac.kopo.gameshop.model.Member;

public interface MemberDao {
    Member login(Member item);

    int checkId(String id);

    void signup(Member member);
}
