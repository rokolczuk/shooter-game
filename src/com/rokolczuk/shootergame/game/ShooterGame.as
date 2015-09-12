/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game
{
import flash.display.Sprite;

public class ShooterGame extends Sprite
{
    private var _context:ShooterGameContext;
    
    public function ShooterGame()
    {
        super();
        initShooterGame();
    }

    private function initShooterGame():void
    {
        _context = new ShooterGameContext(this);
    }
}
}
