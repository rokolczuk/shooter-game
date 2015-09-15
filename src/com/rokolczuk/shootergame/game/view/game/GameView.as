/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.game
{
import com.rokolczuk.shootergame.game.view.game.event.PauseButtonEvent;
import com.rokolczuk.shootergame.game.view.hud.HudView;
import com.rokolczuk.shootergame.graphics.GameSymbol;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class GameView extends Sprite
{
    private var _hudView:HudView;

    private var _gameSymbol:GameSymbol;

    private var _paused:Boolean = false;

    public function GameView(gameSymbol:GameSymbol)
    {
        super();
        _gameSymbol = gameSymbol;
        initGameView();


    }

    private function initGameView():void
    {
        addChild(_gameSymbol);

        _hudView = new HudView(_gameSymbol.hud);
        addChild(_hudView);

        _gameSymbol.pauseButton.useHandCursor = _gameSymbol.pauseButton.buttonMode = true;
        _gameSymbol.pauseButton.addEventListener(MouseEvent.CLICK, pauseButtonClickHandler, false, 0, true);

        new LazyMediatorActivator(this);
    }

    private function pauseButtonClickHandler(event:MouseEvent):void
    {
        event.stopImmediatePropagation();
        _paused = !_paused;
        _gameSymbol.pauseButton.labelTxt.text = _paused ? "RESUME" : "PAUSE";
        dispatchEvent(new PauseButtonEvent(PauseButtonEvent.CLICKED));
    }

    public function addEntityView(view:Sprite):void
    {
       _gameSymbol.entitiesContainer.addChild(view);
    }

    public function removeEntityView(view:Sprite):void
    {
        _gameSymbol.entitiesContainer.removeChild(view);
    }

}
}
