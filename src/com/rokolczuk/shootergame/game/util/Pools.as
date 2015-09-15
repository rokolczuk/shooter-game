/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.util
{
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Bullet;
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Enemy;

public class Pools
{
  public static const BULLETS_POOL:ObjectPool = new ObjectPool(20, Bullet, true);
  public static const ENEMIES_POOL:ObjectPool = new ObjectPool(10, Enemy, true);
}
}
