/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.*;

import flash.display.Sprite;

public class ViewComponent extends Component
{
    private var _view:Sprite;

    public function ViewComponent(view:Sprite)
    {
        super();
        _view = view;
    }

    public function get x():Number
    {
        return _view.x;
    }

    public function set x(value:Number):void
    {
        _view.x = value;
    }

    public function get y():Number
    {
        return _view.y;
    }

    public function set y(value:Number):void
    {
        _view.y = value;
    }

    public function getView():Sprite
    {
        return _view;
    }
}
}
