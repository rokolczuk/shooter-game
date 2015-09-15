/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.view.game.event
{
import flash.events.Event;

public class PauseButtonEvent extends Event
{
    public static const CLICKED:String = "Pause Button Event: Clicked";

    public function PauseButtonEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
    }
}
}
