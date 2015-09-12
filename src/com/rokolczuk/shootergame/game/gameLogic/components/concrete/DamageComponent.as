/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;

public class DamageComponent extends Component
{
    private var _damage:uint;

    public function DamageComponent(damage:uint)
    {
        super();
        _damage = damage;
    }

    public function get damage():uint
    {
        return _damage;
    }
}
}
