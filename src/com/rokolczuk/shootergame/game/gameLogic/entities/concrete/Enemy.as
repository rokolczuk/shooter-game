/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.entities.concrete
{

import com.rokolczuk.shootergame.game.gameLogic.components.concrete.CollidableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.DamageComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ObjectPoolComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ScoreComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ShootingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.HealthComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.MovingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.PositionableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.GameEntity;
import com.rokolczuk.shootergame.game.gameLogic.model.CollisionMasks;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;
import com.rokolczuk.shootergame.game.util.IReusable;
import com.rokolczuk.shootergame.game.util.Pools;
import com.rokolczuk.shootergame.graphics.EnemySpaceshipSymbol;
import com.rokolczuk.shootergame.graphics.PlayerBulletSymbol;

import flash.geom.Point;

public class Enemy extends GameEntity implements IReusable
{
    public function Enemy()
    {
        var viewSymbol:EnemySpaceshipSymbol = new EnemySpaceshipSymbol();

        super(
                new ViewComponent(viewSymbol),
                new CollidableComponent(CollisionMasks.ENEMIES, viewSymbol.bounds.getBounds(viewSymbol)),
                new PositionableComponent(),
                new MovingComponent(),
                new ShootingComponent(new Point(viewSymbol.emmiterPosition.x, viewSymbol.emmiterPosition.y), GameConstants.ENEMY_BULLET_SPEED, PlayerBulletSymbol, GameConstants.ENEMY_SHOOT_PROBABILITY),
                new HealthComponent(GameConstants.ENEMY_HEALTH),
                new DamageComponent(GameConstants.ENEMY_HIT_DAMAGE),
                new ScoreComponent(GameConstants.ENEMY_KILL_SCORE),
                new ObjectPoolComponent(Pools.ENEMIES_POOL)
        );
    }

    public function reuse():void
    {
        HealthComponent(getComponent(HealthComponent)).respawn();
    }
}
}
