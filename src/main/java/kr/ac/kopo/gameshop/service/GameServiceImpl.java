package kr.ac.kopo.gameshop.service;

import kr.ac.kopo.gameshop.dao.GameDao;
import kr.ac.kopo.gameshop.model.Game;
import kr.ac.kopo.gameshop.model.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameServiceImpl implements GameService {

    @Autowired
    GameDao dao;

    @Override
    public List<Game> list(Search search) {
        return dao.list(search);
    }

    @Override
    public void add(Game item) {
        dao.add(item);
    }

    @Override
    public void delete(int id) {
        dao.delete(id);
    }

    @Override
    public Game item(int id) {
        return dao.item(id);
    }

    @Override
    public void update(Game item) {
        dao.update(item);
    }
}
