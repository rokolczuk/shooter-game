/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.view
{
import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

public class ApplicationViewMediator extends Mediator
{
    private var _view:ApplicationView;

    public function ApplicationViewMediator(view:ApplicationView)
    {
        super();
        _view = view;
    }

    override public function onRegister():void
    {
    }

    private function enterFrameHandler(event:Event):void
    {
    }
}
}
