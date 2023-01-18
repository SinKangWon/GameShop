package kr.ac.kopo.gameshop.dao;

import kr.ac.kopo.gameshop.model.Game;
import kr.ac.kopo.gameshop.model.Search;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Repository
public class GameDaoImpl implements GameDao{

    @Autowired
    SqlSession sql;

    @Override
    public List<Game> list(Search search) {
        return sql.selectList("game.list", search);
    }

    @Override
    public void add(Game item) {
        sql.insert("game.add", item);
    }

    @Override
    public void delete(int id) {
        sql.delete("game.delete",id);
    }

    @Override
    public Game item(int id) {
        return sql.selectOne("game.item",id);
    }

    @Override
    public void update(Game item) {
        sql.update("game.update", item);
    }


}
