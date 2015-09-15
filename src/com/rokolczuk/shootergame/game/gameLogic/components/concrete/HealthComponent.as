/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

public class HealthComponent extends Component
{
    private var _health:int;
    private var _invulnurable:Boolean = false;
    private var _initialhealth:int;

    public function HealthComponent(health:int)
    {
        super();
        _initialhealth = health;
        respawn();
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

    public function get invulnurable():Boolean
    {
        return _invulnurable;
    }

    public function set invulnurable(value:Boolean):void
    {
        _invulnurable = value;
    }

    public function respawn():void
    {
        _health = _initialhealth;
    }
}
}
