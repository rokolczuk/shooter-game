/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.view
{
import com.rokolczuk.shootergame.game.view.game.GameView;
import com.rokolczuk.shootergame.game.view.menu.MainMenuView;
import com.rokolczuk.shootergame.graphics.GameSymbol;
import com.rokolczuk.shootergame.graphics.MainMenuSymbol;

import flash.display.Sprite;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class ApplicationView extends Sprite
{
    private var _mainMenu:MainMenuView;
    private var _game:GameView;

    public function ApplicationView()
    {
        super();
        initShooterGameView();
        new LazyMediatorActivator(this);
    }

    private function initShooterGameView():void
    {
        _mainMenu = new MainMenuView(new MainMenuSymbol());
        addChild(_mainMenu);

        _game = new GameView(new GameSymbol());
        addChild(_game);

        new LazyMediatorActivator(this);
    }
}
}
