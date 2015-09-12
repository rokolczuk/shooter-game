/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.event
{
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;

import flash.events.Event;

public class EntityViewEvent extends Event
{
    public static const CREATE_VIEW:String = "Entity Event: Create View";
    public static const DESTROY_VIEW:String = "Entity Event: Destroy View";

    private var _entityViewComponent:ViewComponent;

    public function EntityViewEvent(type:String, entityViewComponent:ViewComponent)
    {
        super(type);
        _entityViewComponent = entityViewComponent;
    }

    public function get entityViewComponent():ViewComponent
    {
        return _entityViewComponent;
    }
}
}
