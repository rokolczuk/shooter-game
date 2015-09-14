/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.game
{
import com.rokolczuk.shootergame.game.event.EntityViewEvent;
import com.rokolczuk.shootergame.game.event.GameEvent;
import com.rokolczuk.shootergame.game.gameLogic.gameController.IGameController;

import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

public class GameViewMediator extends Mediator
{
    private var _gameView:GameView;
    private var _gameRunning:Boolean = false;
    private var _gameController:IGameController;

    public function GameViewMediator(gameView:GameView, gameController:IGameController)
    {
        super();
        _gameView = gameView;
        _gameController = gameController;
        _gameRunning = false;
    }


    override public function onRegister():void
    {
        _gameView.visible = false;

        addContextListener(GameEvent.START, startGameHandler);
        addContextListener(GameEvent.GAME_OVER, gameOverHandler);

        addContextListener(EntityViewEvent.CREATE_VIEW, entitityViewCreatedHandler);
        addContextListener(EntityViewEvent.DESTROY_VIEW, entityViewDestroyedHandler);

        addViewListener(Event.ENTER_FRAME, enterFrameHandler);
    }

    override public function onRemove():void
    {
        removeContextListener(GameEvent.START, startGameHandler);
        removeContextListener(GameEvent.GAME_OVER, gameOverHandler);

        removeContextListener(EntityViewEvent.CREATE_VIEW, entitityViewCreatedHandler);
        removeContextListener(EntityViewEvent.DESTROY_VIEW, entityViewDestroyedHandler);

        removeViewListener(Event.ENTER_FRAME, enterFrameHandler);
    }

    private function enterFrameHandler(event:Event):void
    {
        if(_gameRunning)
        {
            _gameController.update();
        }
    }

    private function gameOverHandler(event:GameEvent):void
    {
        _gameView.visible = false;
        _gameRunning = false;
    }

    private function startGameHandler(event:GameEvent):void
    {
        _gameView.visible = true;
        _gameRunning = true;
        _gameController.start();
    }

    private function entitityViewCreatedHandler(event:EntityViewEvent):void
    {
        _gameView.addEntityView(event.entityViewComponent.getView());
    }

    private function entityViewDestroyedHandler(event:EntityViewEvent):void
    {
        _gameView.removeEntityView(event.entityViewComponent.getView());
    }
}
}
