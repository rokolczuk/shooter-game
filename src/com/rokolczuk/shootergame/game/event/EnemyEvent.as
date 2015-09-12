/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.event
{
import com.rokolczuk.shootergame.game.gameLogic.entities.concrete.Enemy;

import flash.events.Event;

public class EnemyEvent extends Event
{
    public static const SPAWN:String = "Enemy Event: Spawn";

    private var _enemy:Enemy;

    public function EnemyEvent(type:String, enemy:Enemy)
    {
        super(type, bubbles, cancelable);
        _enemy = enemy;
    }

    public function getEnemy():Enemy
    {
        return _enemy;
    }
}
}
