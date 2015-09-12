/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.event
{
import flash.events.Event;

public class PlayerShipEvent extends Event
{
    public static const TRY_TO_SHOOT:String = "Player Ship Event: Try To Shoot";

    public function PlayerShipEvent(type:String)
    {
        super(type);
    }
}
}
