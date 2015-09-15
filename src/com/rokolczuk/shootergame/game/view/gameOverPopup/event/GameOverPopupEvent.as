/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.view.gameOverPopup.event
{
import flash.events.Event;

public class GameOverPopupEvent extends Event
{
    public static const PLAY_AGAIN_BUTTON_CLICKED:String = "Game Over Popup Event: Play Again Button Clicked";

    public function GameOverPopupEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);
    }
}
}
