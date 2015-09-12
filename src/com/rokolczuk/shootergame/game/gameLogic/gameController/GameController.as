/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.gameController
{
import com.rokolczuk.shootergame.game.event.EnemyEvent;
import com.rokolczuk.shootergame.game.event.EntityViewEvent;
import com.rokolczuk.shootergame.game.event.PlayerShipEvent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.CollidableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.DamageComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.HealthComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.MovingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.PositionableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ShootingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.enemies.IEnemiesEmmiter;
import com.rokolczuk.shootergame.game.gameLogic.entities.GameEntity;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Bullet;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Player;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;
import com.rokolczuk.shootergame.game.gameLogic.playerController.IPlayerController;
import com.rokolczuk.shootergame.game.model.GameModel;

import flash.display.MovieClip;
import flash.display.Stage;
import flash.events.IEventDispatcher;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.getTimer;

public class GameController implements IGameController
{
    private var _eventDispatcher:IEventDispatcher;
    private var _gameModel:GameModel;
    private var _playerShip:Player;
    private var _playerController:IPlayerController;

    private var _entities:Vector.<GameEntity> = new Vector.<GameEntity>();
    private var _enemiesEmmiter:IEnemiesEmmiter;
    private var _stage:Stage;

    private var _paused:Boolean = false;


    function GameController(playerController:IPlayerController, playerShip:Player, eventDispatcher:IEventDispatcher,
                            gameModel:GameModel, enemiesEmmiter:IEnemiesEmmiter, stage:Stage)
    {
        _playerController = playerController;
        _eventDispatcher = eventDispatcher;
        _gameModel = gameModel;
        _playerShip = playerShip;
        _enemiesEmmiter = enemiesEmmiter;
        _stage = stage;
        _entities.push(playerShip);

        _playerController.enable();

        mapEventListeners();
    }

    public function update():void
    {
        if(_paused)
        {
            return;
        }

        _enemiesEmmiter.update();

        for (var i:int = 0; i < _entities.length; i++)
        {
            var entity:GameEntity = _entities[i];

            moveEntity(entity);
            checkCollisionsFor(entity);
            shootBullet(entity);
            removeIfOutOfBounds(entity);

        }
    }

    private function removeIfOutOfBounds(entity:GameEntity):void
    {
        if(entity.hasComponent(PositionableComponent))
        {
            var positionableComponent:PositionableComponent = PositionableComponent(entity.getComponent(PositionableComponent));

            if(positionableComponent.x < -GameConstants.OUT_OF_SCREEN_MARGIN || positionableComponent.x > _stage.stageWidth + GameConstants.OUT_OF_SCREEN_MARGIN
            || positionableComponent.y < -GameConstants.OUT_OF_SCREEN_MARGIN || positionableComponent.y > _stage.stageHeight + GameConstants.OUT_OF_SCREEN_MARGIN)
            {
                kill(entity);
            }
        }
    }

    private function shootBullet(entity:GameEntity):void
    {
        if (entity.hasComponent(ShootingComponent))
        {
            var shootingComponent:ShootingComponent = ShootingComponent(entity.getComponent(ShootingComponent));
           if(shootingComponent.chanceToShoot > 0 && Math.random() < shootingComponent.chanceToShoot)
           {
               createBullet(entity);
           }
        }
    }

    private function moveEntity(entity:GameEntity):void
    {
        if (entity.hasComponent(MovingComponent) && entity.hasComponent(PositionableComponent))
        {
            var movingComponent:MovingComponent = MovingComponent(entity.getComponent(MovingComponent));
            var positionableComponent:PositionableComponent = PositionableComponent(entity.getComponent(PositionableComponent));

            positionableComponent.x +=  movingComponent.speedVector.x;
            positionableComponent.y +=  movingComponent.speedVector.y;

            if(entity.hasComponent(ViewComponent))
            {
                var viewComponent:ViewComponent = ViewComponent(entity.getComponent(ViewComponent));

                viewComponent.x = positionableComponent.x;
                viewComponent.y = positionableComponent.y;
            }
        }
    }

    private function checkCollisionsFor(entity:GameEntity):void
    {
        var positionableComponent:PositionableComponent = PositionableComponent(entity.getComponent(PositionableComponent));
        var collidableComponent:CollidableComponent = CollidableComponent(entity.getComponent(CollidableComponent));

        var collidableRect:Rectangle = collidableComponent.bounds.clone();
        collidableRect.offset(positionableComponent.x, positionableComponent.y);

        if (entity.hasComponent(CollidableComponent))
        {
            for (var i:int = 0; i < _entities.length; i++)
            {
               if(_entities[i] != entity && _entities[i].hasComponent(CollidableComponent))
               {
                   var otherCollidable:CollidableComponent = CollidableComponent(_entities[i].getComponent(CollidableComponent));
                   var otherPositionable:PositionableComponent = PositionableComponent(_entities[i].getComponent(PositionableComponent));

                   if(otherCollidable.collisionMask != collidableComponent.collisionMask)
                   {

                       if (Math.abs((positionableComponent.x - otherPositionable.x)) < GameConstants.PRECISE_COLLISION_DISTANCE &&
                               Math.abs((positionableComponent.y - otherPositionable.y)) < GameConstants.PRECISE_COLLISION_DISTANCE)
                       {
                           //more precise collision based on bounding boxes
                           var otherCollidableRect:Rectangle = otherCollidable.bounds.clone();
                           otherCollidableRect.offset(otherPositionable.x, otherPositionable.y);

                           if (collidableRect.intersects(otherCollidableRect))
                           {
                               var healthComponent:HealthComponent = HealthComponent(entity.getComponent(HealthComponent));
                               var damageComponent:DamageComponent = DamageComponent(entity.getComponent(DamageComponent));
                               var otherHealthComponent:HealthComponent = HealthComponent(_entities[i].getComponent(HealthComponent));
                               var otherDamageComponent:DamageComponent = DamageComponent(_entities[i].getComponent(DamageComponent));

                               healthComponent.applyDamage(otherDamageComponent.damage);
                               otherHealthComponent.applyDamage(damageComponent.damage);

                               if(!otherHealthComponent.isAlive())
                               {
                                   kill(_entities[i]);
                               }
                               if(!healthComponent.isAlive())
                               {
                                   kill(entity);
                                   return;
                               }
                           }
                       }
                   }
               }
            }
        }
    }

    private function kill(entity:GameEntity):void
    {
        _entities.splice(_entities.indexOf(entity), 1);
        _eventDispatcher.dispatchEvent(new EntityViewEvent(EntityViewEvent.DESTROY_VIEW, ViewComponent(entity.getComponent(ViewComponent))));
    }

    public function dispose():void
    {
        unmapEventListeners();
    }

    private function mapEventListeners():void
    {
        _eventDispatcher.addEventListener(PlayerShipEvent.TRY_TO_SHOOT, tryShootEventHandler);
        _eventDispatcher.addEventListener(EnemyEvent.SPAWN, spawnEnemyHandler);
    }

    private function unmapEventListeners():void
    {
        _eventDispatcher.removeEventListener(PlayerShipEvent.TRY_TO_SHOOT, tryShootEventHandler);
        _eventDispatcher.removeEventListener(EnemyEvent.SPAWN, spawnEnemyHandler);
    }

    private function spawnEnemyHandler(event:EnemyEvent):void
    {
        _entities.push(event.getEnemy());
        _eventDispatcher.dispatchEvent(new EntityViewEvent(EntityViewEvent.CREATE_VIEW, ViewComponent(event.getEnemy().getComponent(ViewComponent))));
    }

    private function createBullet(emitterEntity:GameEntity):void
    {
        var positionableComponent = emitterEntity.getComponent(PositionableComponent) as PositionableComponent;
        var shootingComponent = emitterEntity.getComponent(ShootingComponent) as ShootingComponent;
        var collidableComponent = emitterEntity.getComponent(CollidableComponent) as CollidableComponent;

        var bulletPosition = new Point(positionableComponent.x + shootingComponent.offset.x, positionableComponent.y + shootingComponent.offset.y);
        var bulletView:MovieClip = new (shootingComponent.bulletSymbolClass);

        var bullet:Bullet = new Bullet(bulletView, collidableComponent.collisionMask, bulletPosition, shootingComponent.bulletSpeed, bulletView.bounds);

        _entities.push(bullet);

        _eventDispatcher.dispatchEvent(new EntityViewEvent(EntityViewEvent.CREATE_VIEW, ViewComponent(bullet.getComponent(ViewComponent))));
    }

    private function tryShootEventHandler(event:PlayerShipEvent):void
    {
        var currentTime:int = getTimer();

        if(currentTime - GameConstants.PLAYER_SHOOT_COOLDOWN > _gameModel.lastTimePlayerShot)
        {
            _gameModel.lastTimePlayerShot = currentTime;
            createBullet(_playerShip);
        }
    }

    public function pause():void
    {
        _paused = true;
        _playerController.disable();
    }

    public function resume():void
    {
        _paused = false;
        _playerController.enable();
    }
}
}
