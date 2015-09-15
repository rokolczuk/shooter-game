/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.view.gameOverPopup
{
import com.rokolczuk.shootergame.game.view.gameOverPopup.event.GameOverPopupEvent;
import com.rokolczuk.shootergame.graphics.GameOverPopupSymbol;

import flash.display.Sprite;
import flash.events.MouseEvent;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class GameOverPopupView extends Sprite
{
    private var _symbol:GameOverPopupSymbol;

    public function GameOverPopupView(symbol:GameOverPopupSymbol)
    {
        super();
        _symbol = symbol;
        initGameOverPopupView();

    }

    private function initGameOverPopupView():void
    {
        addChild(_symbol);
        new LazyMediatorActivator(this);
        _symbol.playAgainButton.addEventListener(MouseEvent.CLICK, playAgainButtonClickHandler, false, 0, true);
    }

    private function playAgainButtonClickHandler(event:MouseEvent):void
    {
        dispatchEvent(new GameOverPopupEvent(GameOverPopupEvent.PLAY_AGAIN_BUTTON_CLICKED));
        event.stopImmediatePropagation();
    }

    public function setScore(score:uint):void
    {
        _symbol.scoreTxt.text = String(score);
    }
}
}
