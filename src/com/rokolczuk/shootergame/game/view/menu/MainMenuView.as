/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.menu
{
import com.rokolczuk.shootergame.game.view.menu.event.MenuEvent;
import com.rokolczuk.shootergame.graphics.MainMenuSymbol;

import flash.display.Sprite;
import flash.events.MouseEvent;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class MainMenuView extends Sprite
{
    private var _symbol:MainMenuSymbol;

    public function MainMenuView(symbol:MainMenuSymbol)
    {
        super();
        _symbol = symbol;
        initMainMenuView();
    }

    private function initMainMenuView():void
    {
        addChild(_symbol);
        _symbol.playButton.addEventListener(MouseEvent.CLICK, playButtonClickHandler, false, 0, true);
        new LazyMediatorActivator(this);
    }

    private function playButtonClickHandler(event:MouseEvent):void
    {
         dispatchEvent(new MenuEvent(MenuEvent.PLAY));
        event.stopImmediatePropagation();
    }
}
}
