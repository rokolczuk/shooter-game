/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

public class ScoreComponent extends Component
{
    private var _score:uint;

    public function ScoreComponent(score:uint)
    {
        super();
        _score = score;
    }

    public function get score():uint
    {
        return _score;
    }
}
}
