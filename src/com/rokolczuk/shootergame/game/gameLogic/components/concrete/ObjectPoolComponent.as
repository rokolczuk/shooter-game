/**
 * Created by rokolczuk on 15/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.components.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.Component;
import com.rokolczuk.shootergame.game.util.IReusable;
import com.rokolczuk.shootergame.game.util.ObjectPool;

public class ObjectPoolComponent extends Component
{
    private var _pool:ObjectPool;

    public function ObjectPoolComponent(pool:ObjectPool)
    {
        super();
        _pool = pool;
    }

    public function putBack():void
    {
        _pool.put(IReusable(_entity));
    }
}
}
