/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

public class HealthComponent extends Component
{
    private var _health:int;

    public function HealthComponent(health:int)
    {
        super();
        _health = health;
    }

    public function get health():int
    {
        return _health;
    }

    public function applyDamage(damage:int):void
    {
        _health -= damage;
    }

    public function isAlive():Boolean
    {
       return _health > 0;
    }
}
}
