/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

import flash.geom.Point;

public class PositionableComponent extends Component
{
    private var _x:Number;
    private var _y:Number;

    public function PositionableComponent(position:Point)
    {
        super();

        if (position)
        {
            _x = position.x;
            _y = position.y;
        }
    }

    public function get x():Number
    {
        return _x;
    }

    public function set x(value:Number):void
    {
        _x = value;
    }

    public function get y():Number
    {
        return _y;
    }

    public function set y(value:Number):void
    {
        _y = value;
    }
}
}
