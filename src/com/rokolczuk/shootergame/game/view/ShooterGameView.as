/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.view
{
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Player;

import flash.display.Sprite;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class ShooterGameView extends Sprite
{
    private var _entitiesLayer:Sprite = new Sprite();
    private var _playerShip:Player;

    public function ShooterGameView(playerShip:Player)
    {
        super();
        _playerShip = playerShip;
        initShooterGameView();
    }

    private function initShooterGameView():void
    {
        addChild(_entitiesLayer);

        var playerShipViewComponent:ViewComponent = ViewComponent(_playerShip.getComponent(ViewComponent));
        entitiesLayer.addChild(playerShipViewComponent.getView());

        new LazyMediatorActivator(this);
    }

    public function get entitiesLayer():Sprite
    {
        return _entitiesLayer;
    }

}
}
