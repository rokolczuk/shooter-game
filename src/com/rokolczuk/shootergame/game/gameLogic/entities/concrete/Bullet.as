/**
 * Created by rokolczuk on 12/09/15.
 */
package com.rokolczuk.shootergame.game.gameLogic.entities.concrete
{
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.CollidableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.DamageComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.HealthComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.MovingComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ObjectPoolComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.PositionableComponent;
import com.rokolczuk.shootergame.game.gameLogic.components.concrete.ViewComponent;
import com.rokolczuk.shootergame.game.gameLogic.entities.*;
import com.rokolczuk.shootergame.game.gameLogic.model.GameConstants;
import com.rokolczuk.shootergame.game.util.IReusable;
import com.rokolczuk.shootergame.game.util.Pools;
import com.rokolczuk.shootergame.graphics.PlayerBulletSymbol;

public class Bullet extends GameEntity implements IReusable
{
    public function Bullet()
    {
        var symbol:PlayerBulletSymbol = new PlayerBulletSymbol();

        super(
                new ViewComponent(symbol),
                new CollidableComponent(0, symbol.bounds.getRect(symbol)),
                new MovingComponent(),
                new PositionableComponent(),
                new HealthComponent(GameConstants.BULLET_HEALTH),
                new DamageComponent(GameConstants.BULLET_HIT_DAMAGE),
                new ObjectPoolComponent(Pools.BULLETS_POOL)
        );
    }

    public function reuse():void
    {
        HealthComponent(getComponent(HealthComponent)).respawn();
    }
}
}
