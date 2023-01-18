package kr.ac.kopo.gameshop.dao;

import kr.ac.kopo.gameshop.model.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{

    @Autowired
    SqlSession sql;

    @Override
    public Member login(Member member) {
        return sql.selectOne("member.login", member);
    }

    @Override
    public int checkId(String id) {
        return sql.selectOne("member.checkId", id);
    }

    @Override
    public void signup(Member member) {
        sql.insert("member.signup", member);
    }
}
