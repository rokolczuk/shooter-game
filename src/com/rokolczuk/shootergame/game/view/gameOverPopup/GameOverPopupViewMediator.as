/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.view.gameOverPopup
{
import com.rokolczuk.shootergame.game.event.GameEvent;
import com.rokolczuk.shootergame.game.model.GameModel;
import com.rokolczuk.shootergame.game.view.gameOverPopup.event.GameOverPopupEvent;

import org.robotlegs.mvcs.Mediator;

public class GameOverPopupViewMediator extends Mediator
{
    private var _view:GameOverPopupView;
    private var _gameModel:GameModel;

    public function GameOverPopupViewMediator(view:GameOverPopupView, gameModel:GameModel)
    {
        super();
        _view = view;
        _gameModel = gameModel;
        _view.visible = false;
    }


    override public function onRegister():void
    {
        addContextListener(GameEvent.GAME_OVER, gameOverHandler);
        addViewListener(GameOverPopupEvent.PLAY_AGAIN_BUTTON_CLICKED, playAgainButtonClickedHandler);
    }

    override public function onRemove():void
    {
        removeContextListener(GameEvent.GAME_OVER, gameOverHandler);
        removeViewListener(GameOverPopupEvent.PLAY_AGAIN_BUTTON_CLICKED, playAgainButtonClickedHandler);
    }

    private function gameOverHandler(event:GameEvent):void
    {
        _view.visible = true;
        _view.setScore(_gameModel.score.getValue());
    }

    private function playAgainButtonClickedHandler(event:GameOverPopupEvent):void
    {
        dispatch(new GameEvent(GameEvent.START));
        _view.visible = false;
    }
}
}
