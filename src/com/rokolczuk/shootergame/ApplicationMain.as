/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame
{
import com.rokolczuk.shootergame.game.ShooterGame;

import flash.display.Sprite;

[SWF(backgroundColor="#000000", frameRate="60", width="300", height="650")]
public class ApplicationMain extends Sprite
{
    private var _shooterGame:ShooterGame;

    public function ApplicationMain()
    {
        super();
        initShooterGameMain();
    }

    private function initShooterGameMain():void
    {
        _shooterGame = new ShooterGame();
        addChild(_shooterGame);
    }
}
}
