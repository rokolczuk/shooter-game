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
import com.rokolczuk.shootergame.game.gameLogic.entities.*;
import com.rokolczuk.shootergame.game.gameLogic.model.CollisionMasks;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;
import com.rokolczuk.shootergame.graphics.PlayerBulletSymbol;
import com.rokolczuk.shootergame.graphics.PlayerSpaceshipSymbol;

import flash.geom.Point;

public class Player extends GameEntity
{
    public function Player()
    {
        var viewSymbol:PlayerSpaceshipSymbol = new PlayerSpaceshipSymbol();

        super(
                new ViewComponent(viewSymbol),
                new CollidableComponent(CollisionMasks.PLAYER, viewSymbol.bounds.getBounds(viewSymbol)),
                new MovingComponent(new Point(0,0)),
                new PositionableComponent(new Point(0, GameConstants.PLAYER_Y)),
                new ShootingComponent(new Point(viewSymbol.emmiterPosition.x, viewSymbol.emmiterPosition.y), GameConstants.PLAYER_BULLET_SPEED, PlayerBulletSymbol, 0),
                new HealthComponent(GameConstants.PLAYER_HEALTH),
                new DamageComponent(GameConstants.PLAYER_HIT_DAMAGE)
        );
    }
}
}
