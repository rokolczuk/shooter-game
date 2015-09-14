/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.hud
{
import com.rokolczuk.shootergame.game.event.GameEvent;
import com.rokolczuk.shootergame.game.event.HUDEvent;
import com.rokolczuk.shootergame.game.model.GameModel;

import org.robotlegs.mvcs.Mediator;

public class HudViewMediator extends Mediator
{
    private var _view:HudView;
    private var _gameModel:GameModel;

    public function HudViewMediator(view:HudView, gameModel:GameModel)
    {
        super();
        _view = view;
        _gameModel = gameModel;
    }


    override public function onRegister():void
    {
        addContextListener(HUDEvent.UPDATE, updateHudHandler);
        updateHud();
    }

    override public function onRemove():void
    {
        removeContextListener(HUDEvent.UPDATE, updateHudHandler);
    }

    private function updateHudHandler(event:HUDEvent):void
    {
        updateHud();
    }

    private function updateHud():void
    {
        _view.score = _gameModel.score;
        _view.numLives = _gameModel.numLives;
    }
}
}
