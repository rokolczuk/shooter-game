/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

import flash.geom.Point;

public class MovingComponent extends Component
{
    private var _speedVector:Point = new Point();

    public function MovingComponent(speedVector:Point = null)
    {
        if (speedVector)
        {
            _speedVector = speedVector;
        }
    }

    public function get speedVector():Point
    {
        return _speedVector;
    }

    public function set speedVector(value:Point):void
    {
        _speedVector = value;
    }
}
}
