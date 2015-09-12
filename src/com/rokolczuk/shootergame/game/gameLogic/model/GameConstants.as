/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.model
{
import com.rokolczuk.shootergame.game.ApplicationConstants;

import flash.geom.Point;

public class GameConstants
{
   public static const PLAYER_Y:uint = ApplicationConstants.GAME_HEIGHT - 50;
   public static const ENEMIES_SPAWN_Y:int = - 50;
   public static const PLAYER_BULLET_SPEED:Point = new Point(0, -6);
   public static const ENEMY_BULLET_SPEED:Point = new Point(0, 4);
   public static const PLAYER_SHOOT_COOLDOWN:uint = 200;
   public static const ENEMY_SPAWN_PROBABILITY:Number = 0.04;
   public static const ENEMY_SPAWN_MARGIN_X:int = 50;
   public static const ENEMY_MIN_SPEED_Y:Number = 1;
   public static const ENEMY_MAX_SPEED_Y:Number = 2;
   public static const PRECISE_COLLISION_DISTANCE:Number = 80;
   public static const BULLET_HEALTH:Number = 1;
   public static const PLAYER_HEALTH:Number = 3;
   public static const ENEMY_HEALTH:Number = 1;
   public static const BULLET_HIT_DAMAGE:Number = 1;
   public static const PLAYER_HIT_DAMAGE:Number = 1;
   public static const ENEMY_HIT_DAMAGE:Number = 1;
   public static const ENEMY_SHOOT_PROBABILITY:Number = 0.005;

}
}
