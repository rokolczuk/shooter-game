/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.enemies
{
import com.rokolczuk.shootergame.game.event.EnemyEvent;
import com.rokolczuk.shootergame.game.event.EntityViewEvent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Enemy;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;

import flash.display.Stage;

import flash.events.IEventDispatcher;
import flash.geom.Point;

public class EnemiesEmmiter implements IEnemiesEmmiter
{
    private var _eventDispatcher:IEventDispatcher;
    private var _stage:Stage;

    public function EnemiesEmmiter(eventDispatcher:IEventDispatcher, stage:Stage)
    {
        _eventDispatcher = eventDispatcher;
        _stage = stage;
    }

    public function update():void
    {
        if(Math.random() < GameConstants.ENEMY_SPAWN_PROBABILITY)
        {
            spawnEnemy();
        }
    }

    private function spawnEnemy():void
    {
        var enemyPosition:Point = new Point(GameConstants.ENEMY_SPAWN_MARGIN_X + Math.random() * (_stage.stageWidth - 2 * GameConstants.ENEMY_SPAWN_MARGIN_X), GameConstants.ENEMIES_SPAWN_Y);
        var enemySpeed:Point = new Point(0, GameConstants.ENEMY_MIN_SPEED_Y + Math.random() * (GameConstants.ENEMY_MAX_SPEED_Y - GameConstants.ENEMY_MIN_SPEED_Y));

        var enemy:Enemy = new Enemy(enemyPosition, enemySpeed);

        _eventDispatcher.dispatchEvent(new EnemyEvent(EnemyEvent.SPAWN, enemy));
    }
}
}
