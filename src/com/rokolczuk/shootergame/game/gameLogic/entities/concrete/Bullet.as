/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.entities.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.CollidableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.DamageComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.HealthComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.MovingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.PositionableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.*;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;

import flash.display.Sprite;
import flash.geom.Point;

public class Bullet extends GameEntity
{
    public function Bullet(view:Sprite, collisionMask:uint, position:Point, speed:Point, boundsView:Sprite)
    {
        super(
                new ViewComponent(view),
                new CollidableComponent(collisionMask, boundsView.getBounds(view)),
                new MovingComponent(speed),
                new PositionableComponent(position),
                new HealthComponent(GameConstants.BULLET_HEALTH),
                new DamageComponent(GameConstants.BULLET_HIT_DAMAGE)
        );
    }
}
}
