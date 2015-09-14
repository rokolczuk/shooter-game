/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.playerController
{
import com.rokolczuk.shootergame.game.event.PlayerShipEvent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.MovingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.PositionableComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Player;

import flash.display.Stage;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;
import flash.geom.Point;

public class MousePlayerController implements IPlayerController
{
    private static const POINT_ZERO:Point = new Point();

    private var _stage:Stage;
    private var _playerShip:Player;
    private var _positionableComponent:PositionableComponent;
    private var _eventDispatcher:IEventDispatcher;

    private var _active:Boolean;

    public function MousePlayerController(stage:Stage, playerShip:Player, eventDispatcher:IEventDispatcher)
    {
        _stage = stage;
        _playerShip = playerShip;
        _eventDispatcher = eventDispatcher;
        _positionableComponent = PositionableComponent(_playerShip.getComponent(PositionableComponent));
    }

    public function enable():void
    {
        if(!_active)
        {
            _stage.addEventListener(MouseEvent.CLICK, mouseClickHandler);
            _stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            _active = true;
        }
    }

    public function disable():void
    {
        if(_active)
        {
            _stage.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
            _stage.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            _active = false;
        }
    }

    private function mouseClickHandler(event: MouseEvent):void
    {
        _eventDispatcher.dispatchEvent(new PlayerShipEvent(PlayerShipEvent.TRY_TO_SHOOT));
    }

    private function enterFrameHandler(event:Event):void
    {
        _positionableComponent.x = Math.max(0, Math.min(_stage.mouseX, _stage.stageWidth));
    }
}
}
