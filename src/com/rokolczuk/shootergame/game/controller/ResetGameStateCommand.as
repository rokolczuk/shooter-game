/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.controller
{
import com.rokolczuk.shootergame.game.event.HUDEvent;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;
import com.rokolczuk.shootergame.game.model.GameModel;

import org.robotlegs.mvcs.Command;

public class ResetGameStateCommand extends Command
{
    private var _gameModel:GameModel;

    public function ResetGameStateCommand(gameModel:GameModel)
    {
        super();
        _gameModel = gameModel;
    }


    override public function execute():void
    {
        _gameModel.numLives = GameConstants.NUM_LIVES;
        _gameModel.score = 0;

        dispatch(new HUDEvent(HUDEvent.UPDATE));
    }
}
}
