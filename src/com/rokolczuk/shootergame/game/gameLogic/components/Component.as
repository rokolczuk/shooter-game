/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components
{
import com.rokolczuk.shootergame.game.gameLogic.entities.GameEntity;

public class Component
{
    private var _entity:GameEntity;

    public function Component()
    {
    }

    public function set entity(value:GameEntity):void
    {
        _entity = value;
    }
}
}
