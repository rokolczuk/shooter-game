/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.event
{
import flash.events.Event;

public class HUDEvent extends Event
{
    public static const UPDATE:String = "Hud Event: Update";

    public function HUDEvent(type:String)
    {
        super(type)
    }
}
}
