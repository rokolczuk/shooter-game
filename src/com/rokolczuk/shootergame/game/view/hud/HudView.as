/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.hud
{
import com.rokolczuk.shootergame.graphics.HUDSymbol;

import flash.display.Sprite;

import org.robotlegs.utilities.lazy.LazyMediatorActivator;

public class HudView extends Sprite
{
    private var _hudSymbol:HUDSymbol;

    public function HudView(hudSymbol:HUDSymbol)
    {
        _hudSymbol = hudSymbol;
        initHudView();
    }

    private function initHudView():void
    {
        addChild(_hudSymbol);
        new LazyMediatorActivator(this);
    }

    public function set score(score:uint):void
    {
        _hudSymbol.scoreTxt.text = String(score);
    }

    public function set numLives(lives:uint):void
    {
        _hudSymbol.livesCounter.livesTxt.text = String(lives);
    }
}
}
