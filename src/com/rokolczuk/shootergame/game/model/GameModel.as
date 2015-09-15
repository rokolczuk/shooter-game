/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.model
{
import com.rokolczuk.shootergame.game.util.ProtectedInt;

public class GameModel
{
    public var lastTimePlayerShot:uint = 0;
    public var numFramesSincePlayerDied:uint = 0;
    public var numFramesPlayerIsInvulnurable:uint = 0;
    public var numLives:ProtectedInt = new ProtectedInt();
    public var score:ProtectedInt = new ProtectedInt();
    public var playerDead:Boolean = false;

    public function GameModel()
    {
    }
}
}
