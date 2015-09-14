/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.model
{
public class GameModel
{
    public var lastTimePlayerShot:uint = 0;
    public var numFramesSincePlayerDied:uint = 0;
    public var numLives:uint = 0;
    public var score:uint = 0;
    public var playerDead:Boolean = false;

    public function GameModel()
    {
    }
}
}
