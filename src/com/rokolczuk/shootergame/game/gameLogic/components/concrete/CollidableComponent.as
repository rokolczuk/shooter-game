/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;
import com.rokolczuk.shootergame.game.gameLogic.entities.GameEntity;

import flash.geom.Rectangle;

public class CollidableComponent extends Component
{
    private var _collisionMask:uint;
    private var _bounds:Rectangle;

    public function CollidableComponent(collisionMask:uint, bounds:Rectangle)
    {
        super();
        _collisionMask = collisionMask;
        _bounds = bounds;
    }

    public function get collisionMask():uint
    {
        return _collisionMask;
    }

    public function get bounds():Rectangle
    {
        return _bounds;
    }

    public function set collisionMask(value:uint):void
    {
        _collisionMask = value;
    }
}
}
