/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.view
{
import com.rokolczuk.shootergame.game.event.EntityViewEvent;
import com.rokolczuk.shootergame.game.gameLogic.gameController.IGameController;

import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

public class ShooterGameViewMediator extends Mediator
{
    private var _view:ShooterGameView;
    private var _gameController:IGameController;

    public function ShooterGameViewMediator(view:ShooterGameView, gameController:IGameController)
    {
        super();
        _view = view;
        _gameController = gameController;
    }

    override public function onRegister():void
    {
        addViewListener(Event.ENTER_FRAME, enterFrameHandler);
        addContextListener(EntityViewEvent.CREATE_VIEW, bulletCreatedHandler);
        addContextListener(EntityViewEvent.DESTROY_VIEW, bulletDestroyedHandler);
    }

    override public function onRemove():void
    {
        removeViewListener(Event.ENTER_FRAME, enterFrameHandler);
        addContextListener(EntityViewEvent.CREATE_VIEW, bulletCreatedHandler);
        addContextListener(EntityViewEvent.DESTROY_VIEW, bulletDestroyedHandler);
    }

    private function enterFrameHandler(event:Event):void
    {
        _gameController.update();
    }

    private function bulletCreatedHandler(event:EntityViewEvent):void
    {
        _view.entitiesLayer.addChild(event.entityViewComponent.getView());
    }

    private function bulletDestroyedHandler(event:EntityViewEvent):void
    {
       _view.entitiesLayer.removeChild(event.entityViewComponent.getView());
    }
}
}
