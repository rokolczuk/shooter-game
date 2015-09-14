/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.event
{
import flash.events.Event;

public class GameEvent extends Event
{
    public static const START:String = "Game Event: Start";
    public static const GAME_OVER:String = "Game Event: Game Over";
    public static const PAUSE:String = "Game Event: Pause";
    public static const RESUME:String = "Game Event: Resume";

    public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
    }
}
}
