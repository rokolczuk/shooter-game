/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.game
{
import com.rokolczuk.shootergame.game.view.hud.HudView;
import com.rokolczuk.shootergame.graphics.GameSymbol;

import flash.display.Sprite;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class GameView extends Sprite
{
    private var _hudView:HudView;

    private var _gameSymbol:GameSymbol;

    public function GameView(gameSymbol:GameSymbol)
    {
        super();
        _gameSymbol = gameSymbol;
        addChild(_gameSymbol);

        _hudView = new HudView(gameSymbol.hud);
        addChild(_hudView);

        new LazyMediatorActivator(this)
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
