package com.chronos333.gamestore.Repository;

import org.springframework.data.repository.CrudRepository;

import com.chronos333.gamestore.model.Game;

public interface GameRepository extends CrudRepository<Game, Integer>{

    
} 