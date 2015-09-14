/**
 * Created by rokolczuk on 14/09/15.
 */
package com.rokolczuk.shootergame.game.view.menu
{
import com.rokolczuk.shootergame.game.event.GameEvent;
import com.rokolczuk.shootergame.game.view.menu.event.MenuEvent;

import org.robotlegs.mvcs.Mediator;

public class MainMenuViewMediator extends Mediator
{
    private var _view:MainMenuView;

    public function MainMenuViewMediator(view:MainMenuView)
    {
        super();
        _view = view;
    }


    override public function onRegister():void
    {
        super.onRegister();
        addViewListener(MenuEvent.PLAY, playHandler);
    }


    override public function onRemove():void
    {
        removeViewListener(MenuEvent.PLAY, playHandler);
    }

    private function playHandler(event:MenuEvent):void
    {
        _view.visible = false;
        dispatch(new GameEvent(GameEvent.START));
    }
}
}
