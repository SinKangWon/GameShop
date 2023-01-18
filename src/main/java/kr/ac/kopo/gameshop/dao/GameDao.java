package kr.ac.kopo.gameshop.dao;

import kr.ac.kopo.gameshop.model.Game;
import kr.ac.kopo.gameshop.model.Search;

import java.util.List;

public interface GameDao {
    List<Game> list(Search search);

    void add(Game item);

    void delete(int id);

    Game item(int id);

    void update(Game item);

}
