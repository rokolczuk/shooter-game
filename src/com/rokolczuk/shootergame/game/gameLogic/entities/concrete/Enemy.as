/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.entities.concrete
{

import com.rokolczuk.shootergame.game.gameLogic.components.concrete.CollidableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.DamageComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ShootingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.HealthComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.MovingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.PositionableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.GameEntity;
import com.rokolczuk.shootergame.game.gameLogic.model.CollisionMasks;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;
import com.rokolczuk.shootergame.graphics.EnemySpaceshipSymbol;
import com.rokolczuk.shootergame.graphics.PlayerBulletSymbol;

import flash.geom.Point;

public class Enemy extends GameEntity
{
    public function Enemy(position:Point, speed:Point)
    {
        var viewSymbol:EnemySpaceshipSymbol = new EnemySpaceshipSymbol();

        super(
                new ViewComponent(viewSymbol),
                new CollidableComponent(CollisionMasks.ENEMIES, viewSymbol.bounds.getBounds(viewSymbol)),
                new PositionableComponent(position),
                new MovingComponent(speed),
                new ShootingComponent(new Point(viewSymbol.emmiterPosition.x, viewSymbol.emmiterPosition.y), GameConstants.ENEMY_BULLET_SPEED, PlayerBulletSymbol, GameConstants.ENEMY_SHOOT_PROBABILITY),
                new HealthComponent(GameConstants.ENEMY_HEALTH),
                new DamageComponent(GameConstants.ENEMY_HIT_DAMAGE)
        );
    }
}
}
