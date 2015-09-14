/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame
{
import com.rokolczuk.shootergame.game.controller.ResetGameStateCommand;
import com.rokolczuk.shootergame.game.event.GameEvent;
import com.rokolczuk.shootergame.game.gameLogic.enemies.EnemiesEmmiter;
import com.rokolczuk.shootergame.game.gameLogic.enemies.IEnemiesEmmiter;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Player;
import com.rokolczuk.shootergame.game.gameLogic.gameController.GameController;
import com.rokolczuk.shootergame.game.gameLogic.gameController.IGameController;
import com.rokolczuk.shootergame.game.gameLogic.playerController.IPlayerController;
import com.rokolczuk.shootergame.game.gameLogic.playerController.MousePlayerController;
import com.rokolczuk.shootergame.game.model.GameModel;
import com.rokolczuk.shootergame.game.view.ApplicationView;
import com.rokolczuk.shootergame.game.view.ApplicationViewMediator;
import com.rokolczuk.shootergame.game.view.game.GameView;
import com.rokolczuk.shootergame.game.view.game.GameViewMediator;
import com.rokolczuk.shootergame.game.view.hud.HudView;
import com.rokolczuk.shootergame.game.view.hud.HudViewMediator;
import com.rokolczuk.shootergame.game.view.menu.MainMenuView;
import com.rokolczuk.shootergame.game.view.menu.MainMenuViewMediator;

import flash.display.DisplayObjectContainer;
import flash.display.Stage;

import org.robotlegs.core.IMediatorMap;
import org.robotlegs.mvcs.Context;
import org.robotlegs.utilities.lazy.LazyMediatorMap;

public class ShooterGameContext extends Context
{

    public function ShooterGameContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
    {
        super(contextView, autoStartup);
    }

    override public function startup():void
    {
        mapViews();
        mapModels();
        mapCommands();
        mapGameActors();
        addRootView();

    }

    private function mapGameActors():void
    {
        injector.mapSingletonOf(IPlayerController, MousePlayerController);
        injector.mapSingletonOf(IGameController, GameController);
        injector.mapSingletonOf(IEnemiesEmmiter, EnemiesEmmiter);
        injector.mapSingleton(Player);
    }

    private function mapCommands():void
    {
         commandMap.mapEvent(GameEvent.START, ResetGameStateCommand);

    }

    private function mapModels():void
    {
        injector.mapSingleton(GameModel);
        injector.mapValue(Stage, contextView.stage);
    }

    private function mapViews():void
    {
        mediatorMap.mapView(ApplicationView, ApplicationViewMediator);
        mediatorMap.mapView(HudView, HudViewMediator);
        mediatorMap.mapView(MainMenuView, MainMenuViewMediator);
        mediatorMap.mapView(GameView, GameViewMediator);
    }

    private function addRootView() : void
    {
        var shooterGameView : ApplicationView = new ApplicationView();
        contextView.addChild(shooterGameView);
    }

    override protected function get mediatorMap() : IMediatorMap
    {
        return _mediatorMap || (_mediatorMap = new LazyMediatorMap(contextView, injector, reflector));
    }
}
}
