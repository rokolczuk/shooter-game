/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.menu.event
{
import flash.events.Event;

public class MenuEvent extends Event
{
    public static const PLAY:String = "Menu Event: Play";

    public function MenuEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
    }
}
}
