package kr.ac.kopo.gameshop.service;

import kr.ac.kopo.gameshop.model.Game;
import kr.ac.kopo.gameshop.model.Search;

import java.util.List;

public interface GameService {
    List<Game> list(Search search);

    void add(Game item);

    void delete(int id);

    Game item(int id);

    void update(Game item);

}
