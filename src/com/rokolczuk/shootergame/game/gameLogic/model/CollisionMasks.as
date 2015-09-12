/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.model
{
public class CollisionMasks
{
    private static var currentMaskIndex:uint = 0;

    public static const PLAYER:uint = 2 << (++currentMaskIndex);
    public static const ENEMIES:uint = 2 << (++currentMaskIndex);

    public function CollisionMasks()
    {
    }
}
}
